# `.github/scripts`

## `check_roadmap_areas.py`

The roadmap directories under `EpsilonEridaniRoadmaps/` are the source of truth for the
list of roadmaps. That list is also copied into the `area` dropdowns of the
issue templates (`1-intention.yml`, `2-roadmap-issue.yml`) and, with prose
titles, into the README's "Roadmaps" list. GitHub issue forms have no
templating, so the dropdown copies cannot be removed.

- `python3 .github/scripts/check_roadmap_areas.py` checks all three against the
  directories and exits non-zero on drift (handy locally).
- `--fix` regenerates the two dropdowns from the directory list and heals the
  README list. The README heal fills gaps only: a missing roadmap is appended
  with the title taken from its own `# ` heading, an orphaned line is dropped,
  and the list is renumbered, but existing entries are left exactly as they
  are, so a curated order or a hand-shortened title is preserved.

The [`sync-roadmap-dropdowns`](../workflows/sync-roadmap-dropdowns.yml) workflow
runs `--fix` after every merge to `main` that changes the roadmap set and
commits the result, so contributors never update the dropdowns or remember to
list a new roadmap themselves. If they did already write a README line (with a
nicer title than the heading), the heal sees no gap and leaves it untouched.

### One-time setup for the auto-commit

The sync workflow pushes to `main`, which is protected, so it authenticates as a
dedicated GitHub App that sits in the bypass list of main's protection ruleset.
A ruleset (not classic branch protection) is required here: classic protection
has no way to let an app bypass a required status check, so its direct push is
rejected with "Required status check 'build' is expected"; a ruleset's bypass
list waives every rule for the listed actor. One-time setup by an org admin:

1. **Create the app** (org Settings -> Developer settings -> GitHub Apps -> New).
   - Webhook: uncheck *Active* (it needs none).
   - Repository permissions: **Contents: Read and write**, and **Administration: Read and write**
     (Metadata: Read-only is added automatically).
   - "Where can this app be installed": *Only on this account*.
2. **Generate a private key** (app page -> bottom -> Generate a private key)
   and note the numeric **App ID** near the top.
3. **Install it** on the `eic` org, scoped to this repo.
4. **Store the credentials** on the repo:
   - `gh variable set SYNC_BOT_APP_ID --body <app-id>`
   - `gh secret set SYNC_BOT_APP_PRIVATE_KEY < path/to/key.pem`
5. **Add the app to the ruleset's bypass list.** `main` is governed by a
   repository ruleset (Settings -> Rules -> Rulesets -> "main"), which requires a
   pull request with code-owner review and the `build` check, and blocks
   force-pushes and deletion. Add the app to that ruleset's **Bypass list**
   (Bypass mode: *Always*). Those rules still apply to everyone else, so humans
   are protected exactly as before; only the app may push directly.

If setup is incomplete the workflow still runs and computes the fix, but the
final `git push` fails, which is a visible signal rather than a silent miss.

## `check_progress_pins.py`

`progress-merge.yml` and `progress-announce.yml` call reusable workflows in
EpsilonEridaniProgress, pinned by full SHA in their `uses:` lines. Dependabot bumps
those lines and nothing else, and both callers run from the base branch, so a bump
that breaks a call would only fail after it merged (as #37/#38 did: `merge.yml`
renamed `app_id` to `client_id`). Two things prevent that:

- `progress_ref`, which must name the same commit as `uses:`, is never written down:
  each caller reads it from its own `uses:` line at run time with
  [`.github/actions/progress-pin`](../actions/progress-pin/action.yml), from the
  trusted (`github.workflow_sha`) copy of the workflow. Dependabot bumps both
  workflows in one group.
- `python3 .github/scripts/check_progress_pins.py` checks every call against the
  called workflow at its pinned commit: no input or secret it does not declare, none
  it requires missing, no literal SHA in `progress_ref`, one pin across both files.
  The [`progress-pins`](../workflows/progress-pins.yml) workflow runs it, with
  `test_check_progress_pins.py`, on `pull_request`, so a Dependabot bump's own pull
  request shows the break. Needs PyYAML.
