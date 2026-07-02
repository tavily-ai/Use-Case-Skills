---
name: risk-compliance-research
description: Screen companies, vendors, counterparties, merchants, suppliers, executives, or products for risk, KYC, compliance, sanctions, adverse media, regulatory, legal, safety, supply-chain, and security concerns. Use when the user asks for vendor risk, KYC, adverse media, sanctions screening, regulatory checks, supplier risk, due diligence, or compliance research grounded in web sources.
---

# Risk Compliance Research

## Workflow

Use fast targeted search and extraction. Treat the result as research support, not a final legal or compliance determination.

1. Identify the entity, jurisdiction, aliases, subsidiaries, people, products, and risk categories.
2. Use targeted `tvly search` queries for adverse media, enforcement actions, sanctions, litigation, regulatory warnings, recalls, cybersecurity incidents, supply-chain issues, and official registries.
3. Use `tvly extract` on official agency pages, court/regulatory pages, company disclosures, credible news, sanctions/regulatory databases, and primary source documents.
4. Use `map` if the relevant official or company domain is known but the needed registry, policy, or disclosure page is hard to locate.
5. Use `crawl` only for scoped official directories, policy pages, recalls/advisories, or supplier/product pages.

## Endpoint Selection

- Use `search + extract` by default.
- Use domain filters for official or high-trust sources when stakes are high.
- Use `map + extract` to find specific pages inside large agency, registry, or company sites.
- Avoid `research` unless the user asks for a full due diligence report; even then, verify high-impact claims with extraction from primary sources.

## Output

Return:

- Entity and aliases checked
- Risk categories searched
- Findings by severity: high, medium, low, none found
- Evidence summary with source URLs
- Confidence and gaps
- Recommended next checks

Never state that an entity is definitively cleared unless the user supplied authoritative internal checks. Say "no relevant findings found in searched sources" instead.
