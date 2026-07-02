---
name: vendor-risk-kyc-screening
description: Screen vendors, merchants, suppliers, counterparties, companies, executives, and related entities for vendor risk, KYC, adverse media, sanctions, regulatory actions, litigation, recalls, supplier risk, cybersecurity incidents, and compliance concerns. Use when the user asks for vendor onboarding research, KYC screening, supplier due diligence, merchant case research, or a source-grounded risk brief.
---

# Vendor Risk KYC Screening

## Workflow

Treat this as research support, not a final compliance determination.

1. Identify the entity, aliases, parent/subsidiaries, executives, jurisdictions, products, and risk categories.
2. Break the screen into short sub-queries under 400 characters for each alias and risk type: sanctions, enforcement, litigation, regulatory warning, recall, adverse media, cybersecurity incident, supplier risk, and jurisdiction.
3. Use exact-match style queries for legal names, people, product names, and phrases that must appear verbatim.
4. Search first, then filter by domain trust and source type before extracting. Prioritize official regulators, sanctions lists, court records, recall databases, company disclosures, and credible news.
5. Extract selected URLs with a focused `query` and `chunks_per_source=2-3`.
6. Use map only when a known regulator, registry, or company site needs URL discovery.
7. Use crawl only for scoped official directories, recalls/advisories, policy pages, or supplier/product pages.

## Tavily Pattern

- Default: `search + extract`
- Official site discovery: `map + extract`
- Scoped registries or directories: `map + crawl + extract`
- Full due diligence report: `research`, then verify high-impact claims with extract

## Parameter Guidance

- Use `search_depth=advanced` for exact entity names, legal matters, sanctions, enforcement actions, and high-stakes claims.
- Use `topic=news` with `time_range` for recent adverse media or incidents.
- Use short `include_domains` lists for regulators, court systems, sanctions databases, recall databases, and trusted publications.
- Use `extract_depth=advanced` for registry tables, sanctions pages, filings, and structured records.
- For crawl, start with `max_depth=1`, `limit=20`, strict `select_paths`, semantic `instructions`, and `chunks_per_source=3`.

## Output

Return:

- Entity and aliases checked
- Jurisdictions and risk categories searched
- Findings by severity: high, medium, low, none found
- Evidence summary with URLs
- Confidence and source gaps
- Recommended next checks

Say "no relevant findings found in searched sources" instead of "cleared" unless the user supplied authoritative internal checks.
