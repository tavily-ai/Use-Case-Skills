---
name: threat-intelligence-enrichment
description: Enrich threat intelligence from CVEs, IOCs, malware names, threat actors, vendor advisories, security incidents, exploit reports, vulnerability disclosures, breach news, and mitigation guidance. Use when the user asks to investigate a CVE, enrich indicators, summarize vendor advisories, assess exploit status, collect mitigations, or produce a source-grounded security brief.
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

# Threat Intelligence Enrichment

## Workflow

Prioritize authoritative and recent sources. Separate confirmed facts from unverified reporting.
Use Tavily through the CLI or equivalent Tavily endpoint skill/tool surface.

1. Identify the input type: CVE, IOC, malware/tool, threat actor, vendor/product, advisory URL, incident, or campaign.
2. Break the task into short sub-queries: identifier, affected product, exploit status, vendor advisory, patches, mitigations, exploitation in the wild, and recent reporting.
3. Search first, using exact-match style queries for CVEs, hashes, domains, IPs, advisory IDs, and malware names.
4. Filter sources before extraction. Prioritize NVD/CVE records, vendor advisories, CISA/agency alerts, security research blogs, reputable incident reports, and official patch notes.
5. Extract selected pages with a focused `query` and `chunks_per_source=2-3`.
6. Use map for vendor advisory portals or documentation sites when the relevant page is hard to find.
7. Use crawl only for scoped advisory, changelog, release note, or documentation sections.

## Tavily Pattern

- Default: `search + extract`
- Vendor portal discovery: `map + extract`
- Advisory/doc collection: `map + crawl + extract`
- Broad threat landscape report: `research` only when explicitly requested

## Parameter Guidance

- Use `search_depth=advanced` for CVEs, IOCs, exact advisory IDs, exploit status, and high-impact claims.
- Use `topic=news` plus `time_range=week` or `month` for active exploitation and recent incidents.
- Use domain filters for high-trust sources such as vendor domains, cisa.gov, nvd.nist.gov, cve.org, cert/cc, and reputable security research sites.
- Use `extract_depth=advanced` for advisory tables, affected-version matrices, patch notes, and structured security pages.
- Cap extract batches at 20 URLs. If there are more candidates, dedupe, rank by source authority and threat relevance, then process in batches.
- For crawl, start with `max_depth=1`, `limit=20`, strict `select_paths`, semantic `instructions`, and `chunks_per_source=3`.
- Report failed extraction or crawl results explicitly, especially when failures affect vendor advisories, CVE records, or mitigation evidence.

## Output

Return:

- Entity or indicator enriched
- Summary and current status
- Affected products, versions, or systems when available
- Exploit status and evidence quality
- Mitigations, patches, detections, or recommended checks
- Timeline of notable updates
- Sources and confidence gaps

Do not overstate attribution, exploitation, or compromise evidence. Label speculation and unverified claims.
