---
name: company-research
description: Research companies, accounts, customers, vendors, partners, or prospects for sales, marketing, strategy, and business development. Use when the user asks for a company brief, account intelligence, sales prep, customer research, executive/buyer context, recent company news, product or hiring signals, or a concise profile of an organization grounded in current web sources.
---

# Company Research

## Workflow

Prefer fast, source-grounded research. Use Tavily search and extract before considering slower research-style workflows.

1. Define the target company and purpose: sales prep, account brief, customer profile, partner research, vendor snapshot, or executive context.
2. Search for the company using targeted queries. Start with `tvly search "<company> company overview recent news customers products" --json`.
3. Extract only the strongest sources: official website, recent announcements, credible news, funding/financial pages, leadership pages, product pages, and relevant filings.
4. Use map only when the official site is large and the needed pages are unclear.
5. Use crawl only when the user asks for a broader site scan, such as all product pages, newsroom posts, customer stories, or documentation.

## Tavily Pattern

Use these endpoint choices:

- `search`: default first step when URLs are unknown.
- `extract`: use on selected URLs for clean page content.
- `map`: use to discover pages on a known company domain.
- `crawl`: use sparingly for site sections such as `/news`, `/customers`, `/products`, or `/case-studies`.
- `research`: avoid by default; reserve for explicit deep report requests.

Keep queries short and specific. Prefer multiple targeted searches over one long prompt.

## Output

Return a concise brief with:

- Company snapshot: what it does, target customers, core products, size/stage if available.
- Recent signals: news, launches, partnerships, hiring, funding, leadership changes, customer wins.
- Sales or strategy relevance: likely priorities, pain points, buying triggers, and useful outreach angles.
- Open questions: unknowns worth verifying with the user or a sales/customer team.
- Sources: cite URLs used for each important claim.

Flag uncertainty clearly. Do not invent revenue, employee count, customers, or leadership details when sources are weak.
