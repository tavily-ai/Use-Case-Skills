# Use Case Skills

Outcome-oriented Tavily skills for common research workflows.

This repo intentionally organizes skills by broad use case instead of by endpoint. Each skill chooses the right Tavily pattern internally:

- `search + extract` for fast source-grounded research
- `map + extract` when a known site needs URL discovery
- `crawl` for scoped multi-page collection
- `research` only for deep report-style synthesis

Each skill applies Tavily best practices: short sub-queries, explicit search depth selection, source filtering before extraction, targeted extract chunks, map-before-crawl planning, conservative crawl limits, and research prompts with clear goals and prior context.

## Skills

| Skill | Primary use case | Default Tavily pattern |
| --- | --- | --- |
| `vendor-risk-kyc-screening` | Vendor onboarding, KYC, adverse media, sanctions, and supplier risk | `search + extract` |
| `sales-account-intelligence` | Sales prep, account briefs, buyer research, and trigger events | `search + extract` |
| `product-competitor-intelligence` | Product/SKU discovery, pricing/spec extraction, and competitor intelligence | `search + extract`, with `map/crawl` for site-scale work |
| `threat-intelligence-enrichment` | CVE, IOC, advisory, exploit, mitigation, and incident enrichment | `search + extract` |
| `investment-research-briefs` | Concise investor briefs, sector snapshots, and risk/catalyst memos | `research` for full briefs, `search + extract` for checks |
| `academic-scientific-research` | Papers, scientific literature, methods, evidence summaries | `search + extract` |

## Design

These skills are designed to compose the endpoint-oriented Tavily skills from `tavily-ai/skills` into marketable workflows that map to common customer needs.

## Standalone Testing

Use `examples/codex-standalone/` to run Codex against an isolated skill set containing only the Tavily endpoint skills and this repo's use-case skills.
