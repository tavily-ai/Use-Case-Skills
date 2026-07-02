---
name: sales-account-intelligence
description: Build sales-ready account intelligence for companies, prospects, customers, partners, and target buyers. Use when the user asks for sales prep, account brief, meeting prep, buyer research, expansion signals, customer intelligence, trigger events, executive context, outreach angles, or market/account context for GTM teams.
license: MIT
metadata:
  author: tavily
  version: "0.1.0"
  homepage: https://www.tavily.com
  source: https://github.com/tavily-ai/use-case-skills
inputs:
  - name: TAVILY_API_KEY
    description: Tavily API key for Tavily CLI requests.
    required: true
---

# Sales Account Intelligence

## Workflow

Optimize for fast, useful account context with cited sources.
Use Tavily through the CLI or equivalent Tavily endpoint skill/tool surface.

1. Define the account, audience, sales motion, geography, and meeting or outreach goal.
2. Split research into short sub-queries under 400 characters: company overview, recent news, products, customers, leadership, funding/financials, hiring, partnerships, pain points, and relevant initiatives.
3. Use search for discovery, then filter by source quality before extracting.
4. Extract the strongest sources: official website, newsroom, product pages, customer stories, investor/press pages, credible news, job postings, and relevant executive profiles.
5. Use map when the company site is large and useful pages are hard to find.
6. Use crawl only for scoped site sections such as `/customers`, `/case-studies`, `/news`, `/products`, `/solutions`, or `/careers`.

## Tavily Pattern

- Default: `search + extract`
- Known company domain: `map + extract`
- Account site scan: `map + crawl + extract`
- Deep strategic account report: `research` only when explicitly requested

## Parameter Guidance

- Use `search_depth=basic` for broad account discovery and `advanced` for precise claims, executive details, metrics, or buyer initiatives.
- Use `topic=news` plus `time_range=month` or `year` for trigger events.
- Use extract `query` and `chunks_per_source=2-3` on long pages to keep the brief focused.
- Cap extract batches at 20 URLs. If there are more candidates, dedupe, rank by source quality and account relevance, then process in batches.
- Use `extract_depth=advanced` for tables, pricing pages, customer lists, or dynamic pages.
- For crawl, start with `max_depth=1`, `max_breadth=20`, `limit=20`, and targeted `select_paths`.
- Report failed extraction or crawl results explicitly, especially when failures affect trigger events, official pages, or customer evidence.

## Output

Return a sales-ready brief:

- Account snapshot
- Recent trigger events
- Business priorities and likely pain points
- Relevant products, initiatives, customers, or markets
- Buyer/executive context when available
- Outreach angles and discovery questions
- Source-backed evidence and gaps

Keep claims practical. Do not invent budget, intent, internal priorities, or buyer names when sources do not support them.
