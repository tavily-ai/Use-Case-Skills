# Use Case Skills

Outcome-oriented Tavily skills for common research workflows.

This repo intentionally organizes skills by broad use case instead of by endpoint. Each skill chooses the right Tavily pattern internally:

- `search + extract` for fast source-grounded research
- `map + extract` when a known site needs URL discovery
- `crawl` for scoped multi-page collection
- `research` only for deep report-style synthesis

## Skills

| Skill | Primary use case | Default Tavily pattern |
| --- | --- | --- |
| `company-research` | Company, account, sales, customer, partner, and vendor briefs | `search + extract` |
| `market-competitor-research` | Competitors, markets, products, SKUs, pricing, and positioning | `search + extract`, with `map/crawl` for site-scale work |
| `investment-research` | Investment memos, portfolio monitoring, company/sector diligence | `research` for full reports, `search + extract` for checks |
| `academic-scientific-research` | Papers, scientific literature, methods, evidence summaries | `search + extract` |
| `risk-compliance-research` | KYC, adverse media, sanctions, vendor and supplier risk | `search + extract` |

## Design

These skills are designed to compose the endpoint-oriented Tavily skills from `tavily-ai/skills` into marketable workflows that map to common customer needs.
