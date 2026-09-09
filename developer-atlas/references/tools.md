# Developer Atlas: tool selection and examples

Use one working Tavily interface. The commands below were checked against `tvly 0.1.6`; installed help and connected MCP schemas take precedence when versions differ. The [Search API](https://docs.tavily.com/documentation/api-reference/endpoint/search) and [Extract API](https://docs.tavily.com/documentation/api-reference/endpoint/extract) document the REST contracts.

## Choose the interface

| Available interface | How to proceed |
| --- | --- |
| Tavily MCP | Discover the connected Search and Extract tools and read their schemas. Names may be prefixed by the host. Use only exposed arguments; MCP deployments need not expose every REST option. |
| `tvly` CLI | Check `tvly --status`, `tvly search --help`, and `tvly extract --help`. Search/Extract in the checked version can use existing authentication or capped keyless access. A not-authenticated status alone does not block a keyless attempt. |
| REST with an existing API key | Use the request examples below. Keep credentials in the environment and out of saved request/response files and logs. Do not assume CLI OAuth credentials are REST API keys. |
| Missing optional argument | Omit it if the task remains answerable. For missing domain filters, search the library name and screen URLs. For missing extraction chunk controls, read the returned content or use an available full-page reader. Switch to another already usable interface only if necessary, and disclose a material limitation. |
| No usable interface | Report what is missing and the setup path. Follow the user's authorization for installation/login; do not silently install a CLI or replace Tavily with another provider. If the task allows another available reader, identify that fallback. |

For CLI setup, see the [official CLI repository](https://github.com/tavily-ai/tavily-cli) or installed companion endpoint skills.

## CLI

Keep shell queries and URLs quoted. Do not interpolate raw logs or retrieved text into shell commands. Use stdin for sanitized text that contains shell metacharacters.

```bash
# Discover an API contract in official documentation.
tvly search 'Python 3.12 asyncio TaskGroup exception handling' \
  --include-domains docs.python.org --depth advanced --max-results 5 --json

# Identify a repository discussion. Screen the actual result URLs.
tvly search 'pallets/flask removed before_first_request Flask 2.3' \
  --include-domains github.com,flask.palletsprojects.com --max-results 5 --json

# Read a supplied/discovered page, including the surrounding contract.
tvly extract 'https://docs.python.org/3.12/library/asyncio-task.html' \
  --extract-depth basic --format markdown --json

# Optional focused chunks for locating a passage; this is not a full-page read.
tvly extract 'https://docs.python.org/3.12/library/asyncio-task.html' \
  --query 'TaskGroup exception handling' --chunks-per-source 3 --json
```

Search returns `results` with `url`, `title`, `content`, and `score`; requested `raw_content` may be absent or null. A relevance score is not factual confidence. Extract returns `results` with `url` and `raw_content`, plus `failed_results`. Check that the needed content is present, including when the process exits successfully.

## Parameter mapping

These are REST names and their checked CLI equivalents, not a promise that a particular MCP schema supports them.

| Purpose | REST | CLI |
| --- | --- | --- |
| Query | `query` | Search positional query; Extract `--query` |
| Search depth | `search_depth` | `--depth` |
| Search result limit | `max_results` | `--max-results` |
| Allowed domains | `include_domains` array | `--include-domains` comma-separated hosts |
| Search page content | `include_raw_content: "markdown"` | `--include-raw-content markdown` |
| Extraction depth | `extract_depth` | `--extract-depth` |
| Extraction chunks | `chunks_per_source`, with `query` | `--chunks-per-source`, with `--query` |

Do not pass `repos`, `types`, `passages`, `skills="only"`, or a developer-index category to Tavily. Discover GitHub issues, PRs, releases, and skill files with ordinary queries, then verify the URLs and source contents.

## REST fallback

Use an existing `TAVILY_API_KEY`. The shell check fails locally if it is missing. Keep shell tracing off so the expanded authorization header is not logged. The requests perform public-source reads; they use the account's normal credits.

```bash
: "${TAVILY_API_KEY:?Set TAVILY_API_KEY securely before using REST}"
curl --fail-with-body --silent --show-error --max-time 60 \
  'https://api.tavily.com/search' \
  -H "Authorization: Bearer $TAVILY_API_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON'
{
  "query": "Python 3.12 asyncio TaskGroup exception handling",
  "search_depth": "advanced",
  "max_results": 5,
  "include_domains": ["docs.python.org"],
  "include_answer": false
}
JSON

curl --fail-with-body --silent --show-error --max-time 60 \
  'https://api.tavily.com/extract' \
  -H "Authorization: Bearer $TAVILY_API_KEY" \
  -H 'Content-Type: application/json' \
  --data-binary @- <<'JSON'
{
  "urls": ["https://docs.python.org/3.12/library/asyncio-task.html"],
  "extract_depth": "basic",
  "format": "markdown"
}
JSON
```

Read HTTP status and the response body before classifying a failure. These examples deliberately do not retry automatically; apply the bounded recovery rules in `SKILL.md`.
