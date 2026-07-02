#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
TEST_ROOT="${CODEX_SKILL_TEST_ROOT:-$ROOT/.codex-standalone}"
TEST_HOME="$TEST_ROOT/home"
TEST_CODEX_HOME="$TEST_ROOT/codex"
PROMPT_FILE="${1:-$ROOT/examples/codex-standalone/prompts/scope-check.md}"

if [[ ! -d "$TEST_CODEX_HOME/skills" ]]; then
  "$SCRIPT_DIR/prepare-codex-home.sh"
fi

if [[ ! -f "$PROMPT_FILE" ]]; then
  echo "Prompt file not found: $PROMPT_FILE" >&2
  exit 1
fi

mkdir -p "$ROOT/examples/codex-standalone/results"

SYSTEM_PROMPT='You are testing a standalone Tavily skill pack. Use only the skills available in CODEX_HOME/skills and the Tavily CLI via `tvly ...`. Do not use native web search, MCP tools, browser tools, curl, wget, Python networking libraries, or non-Tavily web tools. If `tvly` cannot fetch needed evidence, report the gap. Save requested artifacts under examples/codex-standalone/results/.'

PATH_VALUE="/Applications/Codex.app/Contents/Resources:/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

env -i \
  HOME="$TEST_HOME" \
  CODEX_HOME="$TEST_CODEX_HOME" \
  PATH="$PATH_VALUE" \
  TERM="${TERM:-xterm-256color}" \
  TAVILY_API_KEY="${TAVILY_API_KEY:-}" \
  codex exec \
    --ephemeral \
    --ignore-rules \
    --sandbox workspace-write \
    --ask-for-approval on-request \
    --cd "$ROOT" \
    "$SYSTEM_PROMPT" \
    < "$PROMPT_FILE"
