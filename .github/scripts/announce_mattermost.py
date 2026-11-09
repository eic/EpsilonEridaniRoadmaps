#!/usr/bin/env python3
"""Announce a newly-merged PROGRESS.md section in a Mattermost channel, idempotently.

The Zulip announcer lives in EpsilonEridaniProgress (`progress/announce.py`). This is its
Mattermost counterpart. It reuses that module, from a checkout at the pinned commit, for the parts
that do not depend on the chat service: splitting the appended text into header and prose, the
stable section id, and the rendered message. Only the transport is new.

Idempotency follows the Zulip announcer: each section has a stable id, and posting first looks for
it among the channel's recent posts. Mattermost posts can carry hidden metadata, so the id is
stored in the post's `props` as well as in the visible last line of the message; either one counts
as a match. A failed run can therefore be re-run without double-posting.

Failures are split the same way as in the Zulip client: a configuration break (missing settings,
401, a 403 that Mattermost itself answered, a bot that is not a channel member) is a `ConfigError`;
a 5xx or network hiccup is retried and then raised as a `TransientError`. Either one fails the run,
because nothing later would post a lost announcement.

Usage:
    announce_mattermost.py --announcer DIR --section FILE [--roadmap-parent P] [--dry-run]

Settings come from the environment: `MATTERMOST_URL` (the server, e.g. https://chat.example.org),
`MATTERMOST_BOT_TOKEN` (a bot access token) and `MATTERMOST_CHANNEL_ID` (the channel's id, not its
name), the names EpsilonEridani's Mattermost workflows use. Stdlib only.
"""

from __future__ import annotations

import argparse
import json
import os
import pathlib
import re
import sys
import time
import urllib.error
import urllib.request

PROP_KEY = "progress_log_id"

# How far back to look for an earlier post of the same section. A re-run normally follows the
# original within minutes, so 1000 posts is generous even for a busy channel.
SEARCH_PAGES = 5
PER_PAGE = 200

# Zulip renders `repo#NNN` through server-side linkifiers; Mattermost has none, so the forms the
# progress prompt uses are turned into links here. Anything already inside a link or code span is
# left alone (the look-behind/-ahead below), and unknown prefixes stay plain text.
LINKIFIERS = {
    "EpsilonEridani": "https://github.com/eic/EpsilonEridani/issues/",
    "mathlib4": "https://github.com/leanprover-community/mathlib4/issues/",
    "physlib": "https://github.com/leanprover-community/physlib/issues/",
}
LINKIFIER_RE = re.compile(
    r"(?<![\w\[/`])(" + "|".join(map(re.escape, LINKIFIERS)) + r")#(\d+)\b(?![\]`])"
)


class ConfigError(RuntimeError):
    """A persistent auth/permission/config failure that will not self-heal."""


class TransientError(RuntimeError):
    """A hiccup worth retrying."""


def linkify(text: str) -> str:
    return LINKIFIER_RE.sub(lambda m: f"[{m[0]}]({LINKIFIERS[m[1]]}{m[2]})", text)


def load_announcer(directory: str):
    """`progress.announce` from an EpsilonEridaniProgress checkout."""
    sys.path.insert(0, str(pathlib.Path(directory).resolve()))
    from progress import announce  # noqa: PLC0415 - path is only known at run time

    return announce


def build(announce, text: str, roadmap_parent: str) -> tuple[str, str]:
    """`(section id, Mattermost message)` for the appended text of a PROGRESS.md update."""
    header, prose = announce.split_section(text)
    message = announce.render_message(header, prose, roadmap_parent=roadmap_parent)
    return announce.section_id(header), linkify(message)


class Mattermost:
    def __init__(self, url: str, token: str, retries: int = 3):
        self.base = url.rstrip("/") + "/api/v4"
        self.token = token
        self.retries = retries

    def _call(self, method: str, path: str, body: dict | None = None):
        data = json.dumps(body).encode() if body is not None else None
        last = None
        for attempt in range(self.retries):
            req = urllib.request.Request(self.base + path, data=data, method=method)
            req.add_header("Authorization", f"Bearer {self.token}")
            if data is not None:
                req.add_header("Content-Type", "application/json")
            try:
                with urllib.request.urlopen(req, timeout=30) as resp:
                    return json.loads(resp.read().decode() or "null")
            except urllib.error.HTTPError as exc:
                payload = {}
                try:
                    payload = json.loads(exc.read().decode())
                except Exception:  # noqa: BLE001 - a non-JSON error body is itself information
                    pass
                detail = f"Mattermost {method} {path}: {exc.code} {payload or exc.reason}"
                # 401, or a 403/404 that Mattermost itself answered (a JSON body), is a permission or
                # configuration break. An opaque 403 with no body is usually a proxy: transient.
                if exc.code == 401 or (exc.code in (403, 404) and payload):
                    raise ConfigError(detail) from exc
                last = detail
            except (urllib.error.URLError, TimeoutError) as exc:
                last = f"Mattermost {method} {path}: {exc}"
            if attempt + 1 < self.retries:
                time.sleep(2**attempt)
        raise TransientError(last or f"Mattermost {method} {path} failed")

    def check(self, channel_id: str) -> str:
        """Confirm the bot can post in `channel_id`. Raises ConfigError when it cannot."""
        me = self._call("GET", "/users/me")["id"]
        try:
            self._call("GET", f"/channels/{channel_id}/members/me")
        except ConfigError as exc:
            raise ConfigError(
                f"bot (user {me}) is not a member of channel {channel_id}; it cannot post there "
                f"({exc})"
            ) from exc
        return me

    def recent_posts(self, channel_id: str):
        """The channel's posts, newest first, up to SEARCH_PAGES pages."""
        for page in range(SEARCH_PAGES):
            got = self._call(
                "GET", f"/channels/{channel_id}/posts?page={page}&per_page={PER_PAGE}"
            )
            order = got.get("order") or []
            posts = got.get("posts") or {}
            for pid in order:
                yield posts[pid]
            if len(order) < PER_PAGE:
                return

    def send(self, channel_id: str, message: str, sid: str) -> str:
        post = {"channel_id": channel_id, "message": message, "props": {PROP_KEY: sid}}
        return self._call("POST", "/posts", post)["id"]


def already_posted(client, channel_id: str, sid: str, id_prefix: str):
    needle = f"{id_prefix}{sid}"
    for post in client.recent_posts(channel_id):
        if (post.get("props") or {}).get(PROP_KEY) == sid or needle in (post.get("message") or ""):
            return post
    return None


def from_env() -> tuple[Mattermost, str]:
    """A client and channel id from the environment. Values are stripped: a trailing newline in a
    GitHub secret or variable is the most common way this kind of setting breaks."""
    url = (os.environ.get("MATTERMOST_URL") or "").strip()
    token = (os.environ.get("MATTERMOST_BOT_TOKEN") or "").strip()
    channel = (os.environ.get("MATTERMOST_CHANNEL_ID") or "").strip()
    missing = [n for n, v in (("MATTERMOST_URL", url), ("MATTERMOST_BOT_TOKEN", token),
                              ("MATTERMOST_CHANNEL_ID", channel)) if not v]
    if missing:
        raise ConfigError(f"{' / '.join(missing)} not set")
    return Mattermost(url, token), channel


def run(announce, section_file: str, roadmap_parent: str, dry_run: bool = False,
        client=None, channel_id: str | None = None) -> int:
    text = pathlib.Path(section_file).read_text(encoding="utf-8")
    sid, message = build(announce, text, roadmap_parent)

    if dry_run:
        print(f"[dry-run] would post to Mattermost as {sid}:\n\n{message}")
        return 0

    if client is None:
        client, channel_id = from_env()
    client.check(channel_id)

    existing = already_posted(client, channel_id, sid, announce.ID_PREFIX)
    if existing is not None:
        print(f"already announced as post {existing['id']}; nothing to do")
        return 0

    pid = client.send(channel_id, message, sid)
    print(f"posted {pid} for {sid}")
    return 0


def main(argv: list[str] | None = None) -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--announcer", required=True, help="EpsilonEridaniProgress checkout")
    ap.add_argument("--section", required=True, help="the appended PROGRESS.md text")
    ap.add_argument("--roadmap-parent", default="EpsilonEridaniRoadmaps")
    ap.add_argument("--dry-run", action="store_true")
    args = ap.parse_args(argv)
    return run(load_announcer(args.announcer), args.section, args.roadmap_parent, args.dry_run)


if __name__ == "__main__":
    sys.exit(main())
