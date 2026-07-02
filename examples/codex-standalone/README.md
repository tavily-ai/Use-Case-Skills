# Codex Standalone Skill Test

This harness runs Codex with a clean `HOME` and `CODEX_HOME` so the agent sees only:

- Tavily endpoint skills copied from `~/.agents/skills`
- the use-case skills in this repo
- no user `~/.codex/config.toml`
- no user/project rules
- no native Codex web search flag
- no configured MCP servers from the normal Codex home

It is intended for evaluating whether the use-case skills compose correctly with the Tavily CLI endpoint skills.

## Boundary

This isolates Codex from other discovered skills and MCP/plugin config. It does not remove Codex's shell capability entirely. The prompt and copied Tavily skills constrain the agent to `tvly ...`, but a hard guarantee against all non-`tvly` commands requires an OS/container sandbox or a restricted shell environment outside Codex.

## Setup

Prepare the isolated Codex home:

```bash
examples/codex-standalone/bin/prepare-codex-home.sh
```

This creates `.codex-standalone/` in the repo, symlinks your existing Codex auth file, and copies only the allowed skills.

Check that Tavily CLI is ready:

```bash
tvly --status
```

## Run

Run the scope check first:

```bash
examples/codex-standalone/bin/run-codex.sh examples/codex-standalone/prompts/scope-check.md
```

Then run one of the example tasks:

```bash
examples/codex-standalone/bin/run-codex.sh examples/codex-standalone/prompts/sales-account-intelligence.md
examples/codex-standalone/bin/run-codex.sh examples/codex-standalone/prompts/vendor-risk-kyc-screening.md
examples/codex-standalone/bin/run-codex.sh examples/codex-standalone/prompts/product-competitor-intelligence.md
examples/codex-standalone/bin/run-codex.sh examples/codex-standalone/prompts/threat-intelligence-enrichment.md
examples/codex-standalone/bin/run-codex.sh examples/codex-standalone/prompts/investment-research-briefs.md
```

Generated outputs should go under `examples/codex-standalone/results/`, which is ignored by git.
