# Use Case Skills

![Tavily](assets/tavily-primary-logo-white.png)

Outcome-oriented Tavily skills for common research workflows.

This repo is the use-case workflow counterpart to the Tavily CLI skills in [tavily-ai/skills](https://github.com/tavily-ai/skills). The Tavily endpoint skills expose `tvly search`, `tvly extract`, `tvly map`, `tvly crawl`, and `tvly research`; this pack composes those capabilities into repeatable business and research deliverables.

## Installation

Install the Tavily CLI skills first:

```bash
npx skills add https://github.com/tavily-ai/skills
```

Install and authenticate the Tavily CLI:

```bash
curl -fsSL https://cli.tavily.com/install.sh | bash
tvly login --api-key tvly-YOUR_KEY
```

Or set `TAVILY_API_KEY`. Get an API key at [tavily.com](https://www.tavily.com).

This repo intentionally organizes skills by broad use case instead of by endpoint. Each skill chooses the right Tavily pattern internally:

- `search + extract` for fast source-grounded research
- `map + extract` when a known site needs URL discovery
- `crawl` for scoped multi-page collection
- `research` only for deep report-style synthesis

Each skill applies Tavily best practices: short sub-queries, explicit search depth selection, source filtering before extraction, targeted extract chunks, map-before-crawl planning, conservative crawl limits, and research prompts with clear goals and prior context.

## Skills

| Skill | Primary use case | Default Tavily pattern |
| --- | --- | --- |
| [`vendor-risk-kyc-screening`](vendor-risk-kyc-screening/SKILL.md) | Vendor onboarding, KYC, adverse media, sanctions, and supplier risk | `search + extract` |
| [`sales-account-intelligence`](sales-account-intelligence/SKILL.md) | Sales prep, account briefs, buyer research, and trigger events | `search + extract` |
| [`product-competitor-intelligence`](product-competitor-intelligence/SKILL.md) | Product/SKU discovery, pricing/spec extraction, and competitor intelligence | `search + extract`, with `map/crawl` for site-scale work |
| [`threat-intelligence-enrichment`](threat-intelligence-enrichment/SKILL.md) | CVE, IOC, advisory, exploit, mitigation, and incident enrichment | `search + extract` |
| [`investment-research-briefs`](investment-research-briefs/SKILL.md) | Concise investor briefs, sector snapshots, and risk/catalyst memos | `research` for full briefs, `search + extract` for checks |
| [`academic-scientific-research`](academic-scientific-research/SKILL.md) | Papers, scientific literature, methods, evidence summaries | `search + extract` |

## Design

These skills are designed to compose the endpoint-oriented Tavily skills from `tavily-ai/skills` into marketable workflows that map to common customer needs.
