---
name: market-competitor-research
description: Research markets, competitors, product categories, SKUs, pricing pages, positioning, feature comparisons, and market intelligence. Use when the user asks for competitor research, market landscape, SKU discovery, product data enrichment, pricing or packaging comparison, category analysis, or web-scale competitor/product page discovery.
---

# Market Competitor Research

## Workflow

Use this skill for market and competitor intelligence that may require both broad discovery and site-level extraction.

1. Clarify the comparison frame: competitors, product category, geography, customer segment, price band, time period, or feature set.
2. Start with `tvly search` to identify relevant companies, products, category pages, reviews, marketplaces, analyst posts, and official sources.
3. Use `tvly extract` on the highest-value pages for positioning, pricing, product details, and claims.
4. Use `tvly map` when a known competitor or retailer domain needs URL discovery before extraction.
5. Use `tvly crawl` when the user needs many pages from the same site, such as product catalogs, documentation sections, pricing pages, case studies, or category listings.

## Endpoint Selection

- Use `search + extract` for normal competitor and market briefs.
- Use `map + extract` when you know the site but not the relevant URLs.
- Use `map + crawl + extract` for SKU discovery, product catalogs, or broad page collection.
- Avoid `research` unless the user explicitly asks for a long market report.

For crawl tasks, set tight limits first. Prefer scoped paths and instructions, for example product, pricing, docs, case-studies, blog, or category pages.

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
