---
name: product-competitor-intelligence
description: Research competitor products, SKUs, pricing, packaging, positioning, feature comparisons, product catalogs, category pages, retailer listings, marketplace data, and market intelligence. Use when the user asks for competitor SKU discovery, product data enrichment, pricing/spec extraction, product comparison, market intelligence, or crawl/map-driven product research.
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

# Product Competitor Intelligence

## Workflow

Use this skill when product or competitor work benefits from both web discovery and site-level URL discovery.
Use Tavily through the CLI or equivalent Tavily endpoint skill/tool surface.

1. Clarify the category, competitors, geography, target customer, price band, feature set, and desired output format.
2. Split broad questions into short sub-queries: competitors, product category, pricing, alternatives, reviews, SKUs, specs, marketplaces, and recent launches.
3. Search for relevant competitors, product pages, category pages, retailer listings, pricing pages, reviews, docs, and official sources.
4. Filter by relevance score, domain trust, page type, and freshness before extracting.
5. Extract selected pages with a focused `query` and `chunks_per_source=2-3`.
6. Use map before crawl on known competitor, retailer, manufacturer, marketplace, docs, or catalog domains.
7. Crawl only after choosing path patterns and tight limits.

## Tavily Pattern

- Competitor brief: `search + extract`
- Known site, unknown URLs: `map + extract`
- SKU/catalog discovery: `map + crawl + extract`
- Long market report: `research` only if explicitly requested

## Parameter Guidance

- Use `search_depth=basic` for broad discovery and `advanced` for precise SKU, pricing, spec, technical, or availability facts.
- Use `topic=news` and `time_range` for launches, market moves, or product announcements.
- Use `select_paths` for `/products`, `/pricing`, `/category`, `/collections`, `/docs`, `/blog`, `/changelog`, `/customers`, or `/case-studies`.
- Use `exclude_paths` for login, cart, checkout, account, admin, tags, and unrelated pages.
- Cap extract batches at 20 URLs. If there are more candidates, dedupe, rank by page type, source quality, and relevance, then process in batches.
- Use `extract_depth=advanced` for product tables, pricing matrices, specs, structured content, and dynamic pages.
- For crawl, start with `max_depth=1`, `max_breadth=20`, `limit=20`, `instructions`, and `chunks_per_source=3`.
- Report failed extraction or crawl results explicitly, especially when failures affect products, pricing, specs, or competitor coverage.

## Output

For product intelligence, return structured rows:

- Product or SKU
- Company/brand
- URL
- Category
- Features/specs
- Pricing or availability when visible
- Positioning or claims
- Source confidence

For competitor analysis, include positioning, feature/pricing differences, evidence URLs, gaps, and recommended follow-up searches.
