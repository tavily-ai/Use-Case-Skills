# Use Case Skills

Outcome-oriented Tavily skills for common research workflows.

This repo is the use-case workflow counterpart to the Tavily endpoint skills in [tavily-ai/skills](https://github.com/tavily-ai/skills). Endpoint-specific execution details should come from those companion skills; this pack focuses on how to plan, navigate, verify, and format high-value Tavily research workflows.

## Installation

Install the endpoint skills from [tavily-ai/skills](https://github.com/tavily-ai/skills) alongside this repo. Use those skills for setup, authentication, and tool-specific execution details.

This repo intentionally organizes skills by broad use case instead of by endpoint. Each skill chooses the right capability pattern internally:

- search-oriented discovery followed by targeted extraction for fast source-grounded research
- site mapping before extraction when a known domain needs URL discovery
- scoped crawling only when many pages from a known section are needed
- research only for deep report-style synthesis

Each skill applies Tavily best practices: short search queries under 400 characters, source filtering before extraction, map-before-crawl planning, conservative collection scope, clear research goals, citation hygiene, and explicit coverage gaps.

Default execution discipline:

- Start with a small focused set of search queries, not the full possible query list.
- Keep each search query under 400 characters.
- Extract only the strongest sources needed for the deliverable.
- Expand with additional searches only for named evidence gaps.
- Use map only after search shows a known site has useful but buried pages.
- Use crawl only after map identifies a narrow section worth collecting.
- Stop when the output template can be filled with cited evidence and clear gaps.

## Skills

| Skill | Primary use case | Default capability pattern |
| --- | --- | --- |
| [`vendor-risk-kyc-screening`](vendor-risk-kyc-screening/SKILL.md) | Vendor onboarding, KYC, adverse media, sanctions, and supplier risk | discovery, source verification, targeted extraction |
| [`sales-account-intelligence`](sales-account-intelligence/SKILL.md) | Sales prep, account briefs, buyer research, and trigger events | account discovery, source verification, targeted extraction |
| [`product-competitor-intelligence`](product-competitor-intelligence/SKILL.md) | Product/SKU discovery, pricing/spec extraction, and competitor intelligence | discovery, site navigation, scoped collection |
| [`threat-intelligence-enrichment`](threat-intelligence-enrichment/SKILL.md) | CVE, IOC, advisory, exploit, mitigation, and incident enrichment | exact-identifier discovery, authoritative extraction |
| [`investment-research-briefs`](investment-research-briefs/SKILL.md) | Concise investor briefs, sector snapshots, and risk/catalyst memos | research synthesis, source verification |
| [`academic-scientific-research`](academic-scientific-research/SKILL.md) | Papers, scientific literature, methods, evidence summaries | scholarly discovery, evidence extraction |
| [`developer-research`](developer-research/SKILL.md) | Library behavior, API contracts, errors, bug fixes, and migrations | primary-source discovery, targeted extraction, version/release verification |
| [`migrate-to-tavily`](migrate-to-tavily/explanation.md) | Migrate existing Exa/Firecrawl/Perplexity/Parallel integrations to Tavily | code mapping, in-place rewrite |
| [`fill-missing-fields`](fill-missing-fields/explanation.md) | Find and fill in missing fields on an existing list of companies, people, or products | structured per-row research |
| [`build-entity-list`](build-entity-list/explanation.md) | Build a deduplicated list of entities matching given criteria | structured list research |
| [`watch-for-changes`](watch-for-changes/explanation.md) | Watch a page, site, or topic for changes on a recurring schedule | extract/search + scheduled orchestration |
| [`past-research-search`](past-research-search/explanation.md) | Find a past research run by topic instead of by run ID | local run index |

## Design

For an isolated Codex trial of `developer-research`, see the [manual test guide and sample queries](tests/developer-research.md).

These skills are designed to compose endpoint-oriented skills from `tavily-ai/skills` into marketable workflows that map to common customer needs.
