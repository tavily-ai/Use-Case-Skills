---
name: company-research
description: Research companies, accounts, customers, vendors, partners, or prospects for sales, marketing, strategy, and business development. Use when the user asks for a company brief, account intelligence, sales prep, customer research, executive/buyer context, recent company news, product or hiring signals, or a concise profile of an organization grounded in current web sources.
---

# Company Research

## Workflow

Prefer fast, source-grounded research. Use Tavily search and extract before considering slower research-style workflows.

1. Define the target company and purpose: sales prep, account brief, customer profile, partner research, vendor snapshot, or executive context.
2. Break the request into focused sub-queries under 400 characters each. Typical queries: `"<company> company overview"`, `"<company> recent news"`, `"<company> products customers"`, `"<company> leadership funding"` or `"<company> investor relations"` when relevant.
3. Search with `basic` for general discovery. Use `advanced` only when precision matters, such as a specific executive, metric, customer claim, or filing detail.
4. Filter search results by source quality, relevance score, and domain trust before extracting. Prefer official company pages, recent announcements, credible news, funding/financial pages, leadership pages, product pages, and filings.
5. Extract selected URLs with a focused `query` and `chunks_per_source` when pages are long, so only relevant snippets enter context.
6. Use map only when the official site is large and the needed pages are unclear.
7. Use crawl only when the user asks for a broader site scan, such as all product pages, newsroom posts, customer stories, or documentation.

## Tavily Pattern

Use these endpoint choices:

- `search`: default first step when URLs are unknown.
- `extract`: use on selected URLs for clean page content.
- `map`: use to discover pages on a known company domain.
- `crawl`: use sparingly for site sections such as `/news`, `/customers`, `/products`, or `/case-studies`.
- `research`: avoid by default; reserve for explicit deep report requests.

Keep queries short and specific. Prefer multiple targeted searches over one long prompt.

## Parameter Guidance

- Use `topic=news` plus `time_range` for recent announcements or trigger events.
- Use domain filters for trusted targets, such as the company domain, SEC/filing domains, credible business press, or known industry publications.
- Use `include_raw_content` only for quick prototypes or when search results are very likely to be sufficient; otherwise use the two-step search, filter, extract pattern.
- For extract, start with `extract_depth=basic`; retry with `advanced` for JavaScript-heavy pages, tables, pricing, or structured content.
- For crawl, start conservatively with `max_depth=1`, `max_breadth=20`, and `limit=20`; add `instructions` and `chunks_per_source=3` for focused agentic use.
- Monitor failed extraction or crawl results and report any important source gaps.

## Output

Return a concise brief with:

- Company snapshot: what it does, target customers, core products, size/stage if available.
- Recent signals: news, launches, partnerships, hiring, funding, leadership changes, customer wins.
- Sales or strategy relevance: likely priorities, pain points, buying triggers, and useful outreach angles.
- Open questions: unknowns worth verifying with the user or a sales/customer team.
- Sources: cite URLs used for each important claim.

Flag uncertainty clearly. Do not invent revenue, employee count, customers, or leadership details when sources are weak.
