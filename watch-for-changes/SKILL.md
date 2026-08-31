---
name: watch-for-changes
description: |
  Watch a page, site, or topic for changes on a recurring schedule and only speak up when something meaningfully changed. Use this skill when the user wants to track a competitor's pricing page, watch for regulatory filings, keep an eye on a changelog, or says "monitor this page", "watch for changes", "alert me if X changes", "track this site", or "let me know when this updates". This is an orchestration skill built from Tavily's extract/search plus a recurring-task mechanism — Tavily itself has no scheduling API, so this skill documents that explicitly rather than implying otherwise. The recurring-task step is written generically so it works under any agent/CLI, not just Claude Code.
allowed-tools: Bash(tvly *), Bash(python3 *)
---

# watch-for-changes

Check something on the web on a recurring cadence, compare it to what you saw last time, and only report back when there's an actual change.

## Before running any command

If `tvly` is not found on PATH, install it first:

```bash
curl -fsSL https://cli.tavily.com/install.sh | bash && tvly login
```

See [tavily-cli](../tavily-cli/SKILL.md) for alternative install methods and auth options.

## Important: this is orchestration, not a Tavily platform feature

Tavily's API is stateless — it has no built-in scheduling, alerting, or "watch this" endpoint. This skill combines:

- **Tavily** (`tvly extract` or `tvly search`) for the actual "check the thing" step
- **Some recurring-task mechanism** for the "keep doing this on a cadence" step. Use whatever your environment offers:
  - Running in Claude Code: the `schedule` skill (cron-based, unattended) or `/loop` (self-paced, session-scoped)
  - Any other agent/CLI with its own scheduling or long-running-task primitive: use that
  - No agent-level scheduler available: a plain OS cron job / systemd timer / Windows Task Scheduler entry that re-invokes the agent (or the diff script directly) on the target cadence, or a scheduled CI job (e.g. GitHub Actions `schedule` trigger)

Be upfront with the user about this — "monitor" here means "something re-runs this check for you on a cadence," not "Tavily is watching this in the background on its own." Ask the user which mechanism is available/preferred if it isn't obvious.

## When to use

- Watching a specific URL/page for content changes (pricing, terms, changelog, filing status)
- For a recurring *summary of new coverage* on a broad topic (rather than change-detection on one fixed page), that's a different pattern — see the `tavily-news-digest` idea in this repo's suggestions doc. This skill is for detecting *change*, not aggregating *new content*.

## How it works

1. **Baseline:** extract the target page (or run the target search) once, save the content and a hash/fingerprint of it to a local snapshot file.
2. **Schedule:** set up a recurring check at the cadence the user wants, using whatever recurring-task mechanism is available (Claude Code's `schedule` skill or `/loop`, another agent's own scheduler, or plain cron/CI if running standalone).
3. **Each run:** re-extract, compare to the saved snapshot.
   - No meaningful difference → stay quiet, update the snapshot's "last checked" timestamp, don't bother the user.
   - Real difference → summarize what changed and notify.
4. **Update the snapshot** with the new content after each check, whether or not it changed.

## Quick start

**1. Take the baseline snapshot:**

```bash
python3 << 'PYEOF'
import json, subprocess, hashlib, os

url = "https://example.com/pricing"
raw = subprocess.check_output(['tvly', 'extract', url, '--json'], stderr=subprocess.DEVNULL)
data = json.loads(raw)
content = data['results'][0]['raw_content']

os.makedirs('.tavily', exist_ok=True)
snapshot = {
    "url": url,
    "content": content,
    "hash": hashlib.sha256(content.encode()).hexdigest(),
}
with open('.tavily/monitor_pricing.json', 'w') as f:
    json.dump(snapshot, f)

print("Baseline saved.")
PYEOF
```

**2. Set up the recurring check** — point whatever recurring-task mechanism is available at the diff script below: the `schedule` skill or `/loop <interval>` in Claude Code, an equivalent scheduling primitive in another agent, or a plain cron entry / scheduled CI job if running standalone.

**3. Each scheduled run — diff against the saved snapshot:**

```bash
python3 << 'PYEOF'
import json, subprocess, hashlib

url = "https://example.com/pricing"
path = ".tavily/monitor_pricing.json"

with open(path) as f:
    prev = json.load(f)

raw = subprocess.check_output(['tvly', 'extract', url, '--json'], stderr=subprocess.DEVNULL)
data = json.loads(raw)
content = data['results'][0]['raw_content']
new_hash = hashlib.sha256(content.encode()).hexdigest()

if new_hash != prev['hash']:
    print(f"CHANGED: {url}")
    # Optionally diff prev['content'] vs content and summarize the change in plain English
    # (e.g. via a quick tavily-research call or a direct text diff) before alerting the user.
else:
    print(f"No change: {url}")

with open(path, 'w') as f:
    json.dump({"url": url, "content": content, "hash": new_hash}, f)
PYEOF
```

## Options

| Consideration | Guidance |
|---|---|
| Cadence | Match check frequency to how often the thing actually changes — a pricing page doesn't need hourly checks; a live filing tracker might |
| Snapshot storage | Keep one JSON file per monitored target under `.tavily/`, named for what it watches |
| Noisy pages | If a page has content that changes trivially every load (timestamps, ad slots), hash a specific section's content, not the whole page — extract with `--query`/`--chunks-per-source` to narrow to the relevant section first |
| What changed | For a human-readable summary of *what* changed (not just *that* it changed), diff the old and new text and optionally run it through `tvly research` for a plain-English summary |

## Tips

- **Don't over-schedule.** Every check costs an API call — pick a cadence that matches how often the target realistically changes.
- **Narrow what you hash.** Whole-page hashing catches every cosmetic change (ads, timestamps, view counts) as a "change" — extract just the section that matters when possible.
- **Say what kind of change, not just that one happened.** "Changed" is a weak alert — "the Pro plan price moved from $49 to $59" is a useful one.
- **Be explicit that some external mechanism is doing the scheduling**, not a Tavily background service — if the session closes, the loop stops, or the cron/CI job isn't actually wired up, monitoring stops.

## See also

- [tavily-extract](../tavily-extract/SKILL.md) — the underlying content-fetch this skill re-runs on a schedule
- [tavily-search](../tavily-search/SKILL.md) — for monitoring a topic broadly rather than one fixed URL
