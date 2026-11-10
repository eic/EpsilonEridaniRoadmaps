#!/usr/bin/env python3
"""Tests for announce_mattermost.py.

Needs an EpsilonEridaniProgress checkout at the pinned commit, named by `$ANNOUNCER` (default
`announcer/`), because the point of most of these is that the pinned `progress.announce` still
offers what the Mattermost announcer imports. A Dependabot bump that renames any of it fails here,
on the bump's own pull request.
"""

import os
import pathlib
import sys
import tempfile
import unittest

sys.path.insert(0, str(pathlib.Path(__file__).resolve().parent))
import announce_mattermost as am  # noqa: E402

FROM, TO = "1" * 40, "2" * 40
SECTION = f"""
<!--epsiloneridani-progress:v1 {{"from_sha":"{FROM}","prs":[67,68],"roadmap":"Demo","to_sha":"{TO}"}}-->
## Demo: 2026-06-10 to 2026-11-02 (`1111111` to `2222222`)

The first result, see EpsilonEridani#67 and mathlib4#123, and
a second line; ping @all here and #5 there.
"""


class FakeClient:
    def __init__(self, posts=()):
        self.posts = list(posts)
        self.sent = []

    def check(self, channel_id):
        return "bot"

    def recent_posts(self, channel_id):
        yield from reversed(self.posts)

    def send(self, channel_id, message, sid):
        self.sent.append((channel_id, message, sid))
        self.posts.append({"id": f"p{len(self.posts)}", "message": message,
                           "props": {am.PROP_KEY: sid}})
        return self.posts[-1]["id"]


class Linkify(unittest.TestCase):
    def test_known_prefixes_become_links(self):
        self.assertEqual(
            am.linkify("see EpsilonEridani#67."),
            "see [EpsilonEridani#67](https://github.com/eic/EpsilonEridani/issues/67).",
        )

    def test_existing_links_code_and_unknown_prefixes_are_left_alone(self):
        for text in ("[EpsilonEridani#67](u)", "`EpsilonEridani#67`", "other#5", "x/mathlib4#1"):
            self.assertEqual(am.linkify(text), text)


class WithAnnouncer(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.announce = am.load_announcer(os.environ.get("ANNOUNCER", "announcer"))

    def setUp(self):
        fd, self.path = tempfile.mkstemp(suffix=".md")
        os.close(fd)
        pathlib.Path(self.path).write_text(SECTION, encoding="utf-8")
        self.addCleanup(os.unlink, self.path)

    def test_build(self):
        sid, msg = am.build(self.announce, SECTION, "EpsilonEridaniRoadmaps")
        self.assertEqual(sid, "Demo-1111111-2222222")
        self.assertIn("**Demo**", msg)
        self.assertIn("(https://github.com/eic/EpsilonEridani/issues/67)", msg)
        self.assertIn("result, see", msg)
        self.assertIn("and a second line", msg)  # source wrapping is undone
        self.assertNotIn("@all", msg)  # mentions are defused
        self.assertIn("EpsilonEridaniRoadmaps/blob/main/EpsilonEridaniRoadmaps/Demo/STATUS.md", msg)
        self.assertNotIn(self.announce.ID_PREFIX, msg)  # the id lives in props instead
        self.assertTrue(msg.endswith("STATUS.md)"))

    def test_posts_once_then_is_idempotent(self):
        client = FakeClient([{"id": "old", "message": "unrelated", "props": {}}])
        for _ in range(2):
            self.assertEqual(am.run(self.announce, self.path, "EpsilonEridaniRoadmaps",
                                    client=client, channel_id="c"), 0)
        self.assertEqual(len(client.sent), 1)
        self.assertEqual(client.sent[0][2], "Demo-1111111-2222222")

    def test_a_post_with_another_sections_id_does_not_count(self):
        client = FakeClient([{"id": "x", "message": "m", "props": {am.PROP_KEY: "Demo-1-2"}}])
        am.run(self.announce, self.path, "EpsilonEridaniRoadmaps", client=client, channel_id="c")
        self.assertEqual(len(client.sent), 1)

    def test_an_injected_client_without_a_channel_is_refused(self):
        with self.assertRaises(ValueError):
            am.run(self.announce, self.path, "EpsilonEridaniRoadmaps", client=FakeClient())

    def test_missing_settings_are_a_config_error(self):
        env = {k: os.environ.pop(k) for k in list(os.environ) if k.startswith("MATTERMOST_")}
        self.addCleanup(os.environ.update, env)
        with self.assertRaises(am.ConfigError):
            am.run(self.announce, self.path, "EpsilonEridaniRoadmaps")


if __name__ == "__main__":
    unittest.main()
