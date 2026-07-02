#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
TEST_ROOT="${CODEX_SKILL_TEST_ROOT:-$ROOT/.codex-standalone}"
TEST_HOME="$TEST_ROOT/home"
TEST_CODEX_HOME="$TEST_ROOT/codex"
SOURCE_CODEX_HOME="${SOURCE_CODEX_HOME:-$HOME/.codex}"
SOURCE_AGENT_SKILLS="${SOURCE_AGENT_SKILLS:-$HOME/.agents/skills}"

TAVILY_SKILLS=(
  tavily-cli
  tavily-search
  tavily-extract
  tavily-map
  tavily-crawl
  tavily-research
)

USE_CASE_SKILLS=(
  academic-scientific-research
  investment-research-briefs
  product-competitor-intelligence
  sales-account-intelligence
  threat-intelligence-enrichment
  vendor-risk-kyc-screening
)

mkdir -p "$TEST_HOME" "$TEST_CODEX_HOME/skills"

find "$TEST_CODEX_HOME/skills" -mindepth 1 -maxdepth 1 -type d -exec rm -rf {} +

if [[ ! -f "$SOURCE_CODEX_HOME/auth.json" ]]; then
  echo "Missing Codex auth file: $SOURCE_CODEX_HOME/auth.json" >&2
  echo "Run codex login with your normal Codex home, or set SOURCE_CODEX_HOME." >&2
  exit 1
fi

ln -sfn "$SOURCE_CODEX_HOME/auth.json" "$TEST_CODEX_HOME/auth.json"

cat > "$TEST_CODEX_HOME/config.toml" <<'EOF'
# Standalone skill-test config.
# Intentionally empty: do not add MCP servers, plugins, or extra skill roots here.
EOF

for skill in "${TAVILY_SKILLS[@]}"; do
  src="$SOURCE_AGENT_SKILLS/$skill"
  if [[ ! -d "$src" ]]; then
    echo "Missing Tavily endpoint skill: $src" >&2
    exit 1
  fi
  cp -R "$src" "$TEST_CODEX_HOME/skills/$skill"
done

for skill in "${USE_CASE_SKILLS[@]}"; do
  src="$ROOT/$skill"
  if [[ ! -d "$src" ]]; then
    echo "Missing use-case skill: $src" >&2
    exit 1
  fi
  cp -R "$src" "$TEST_CODEX_HOME/skills/$skill"
done

mkdir -p "$ROOT/examples/codex-standalone/results"

echo "Prepared isolated Codex home:"
echo "  HOME=$TEST_HOME"
echo "  CODEX_HOME=$TEST_CODEX_HOME"
echo
echo "Allowed skills:"
find "$TEST_CODEX_HOME/skills" -mindepth 1 -maxdepth 1 -type d -print | sed 's#^.*/##' | sort
