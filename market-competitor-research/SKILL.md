---
name: market-competitor-research
description: Research markets, competitors, product categories, SKUs, pricing pages, positioning, feature comparisons, and market intelligence. Use when the user asks for competitor research, market landscape, SKU discovery, product data enrichment, pricing or packaging comparison, category analysis, or web-scale competitor/product page discovery.
---

# Market Competitor Research

## Workflow

Use this skill for market and competitor intelligence that may require both broad discovery and site-level extraction.

1. Clarify the comparison frame: competitors, product category, geography, customer segment, price band, time period, or feature set.
2. Split broad market questions into sub-queries under 400 characters: competitors, pricing, product category, reviews, alternatives, recent launches, customer segments, and geography.
3. Start with `tvly search` to identify relevant companies, products, category pages, reviews, marketplaces, analyst posts, and official sources.
4. Filter by score, domain trust, and source type before extracting. Do not extract every search result.
5. Use `tvly extract` with a focused `query` and `chunks_per_source` on the highest-value pages for positioning, pricing, product details, and claims.
6. Use `tvly map` when a known competitor or retailer domain needs URL discovery before extraction.
7. Use `tvly crawl` when the user needs many pages from the same site, such as product catalogs, documentation sections, pricing pages, case studies, or category listings.

## Endpoint Selection

- Use `search + extract` for normal competitor and market briefs.
- Use `map + extract` when you know the site but not the relevant URLs.
- Use `map + crawl + extract` for SKU discovery, product catalogs, or broad page collection.
- Avoid `research` unless the user explicitly asks for a long market report.

For crawl tasks, set tight limits first. Prefer scoped paths and instructions, for example product, pricing, docs, case-studies, blog, or category pages.

## Parameter Guidance

- Use `search_depth=basic` for broad market discovery and `advanced` for precise product, pricing, technical, or SKU facts.
- Use `topic=news` and `time_range` for recent launches, funding, partnerships, or market moves.
- Use `map` before `crawl` on large ecommerce, docs, marketplace, or competitor sites; inspect URL patterns, then choose targeted paths.
- For crawls, start with `max_depth=1`, `max_breadth=20`, `limit=20`, `instructions`, and `chunks_per_source=3`.
- Use `select_paths` for product, pricing, category, docs, blog, changelog, customer, or case-study sections; use `exclude_paths` for login, cart, account, admin, tag, and unrelated pages.
- Use `extract_depth=advanced` for product tables, pricing matrices, structured specs, dynamic pages, and rich content.

## Output

For competitor briefs, return:

- Market frame and competitors included.
- Positioning summary by competitor.
- Product, feature, pricing, packaging, and GTM differences.
- Evidence table with source URLs.
- Gaps, opportunities, and recommended follow-up searches.

For SKU or product enrichment, return structured rows:

- Product name
- Brand/company
- URL
- Category
- Specs/features
- Price or availability when visible
- Source confidence

Separate sourced facts from interpretation.
