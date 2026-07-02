---
name: investment-research-briefs
description: Create concise investment research briefs, company memos, sector snapshots, portfolio monitoring updates, earnings/news summaries, risk and catalyst briefs, and market thesis support. Use when the user asks for an investor-focused brief on a company, sector, public/private market, comparable set, or portfolio theme.
---

# Investment Research Briefs

## Workflow

Use research for true report-style synthesis, but use search and extract for faster briefs or source checks.

1. Define the target, investor lens, geography, timeframe, asset type, and desired depth.
2. For quick briefs, split into short sub-queries: business overview, market position, financial/operating signals, recent developments, competitors, risks, catalysts, and valuation/comps if requested.
3. Search and extract from filings, investor relations pages, earnings materials, company pages, regulators, reputable financial media, and market sources.
4. For deeper memos, use Tavily research with a clear goal, known context, constraints, target market, and desired output format.
5. Use `model=mini` for narrow questions and `model=pro` for comprehensive multi-domain analysis.
6. Verify specific cited metrics, quotes, management claims, or filings with extract after research.

## Tavily Pattern

- Quick brief or source check: `search + extract`
- Full investment memo: `research`
- Specific cited claim verification: `extract`
- Large IR/filing page collection: `map + crawl + extract` only when needed

## Parameter Guidance

- Use `topic=finance` for finance-oriented discovery when available.
- Use `topic=news` and `time_range` for recent events.
- Use `search_depth=advanced` for filings, financial metrics, quotes, comparable companies, and company-specific claims.
- Use domain filters for investor relations sites, SEC/filing domains, exchanges, regulators, and reputable financial publications.
- Use extract `query` and `chunks_per_source=3` for long filings, transcripts, reports, and presentations.
- Cap extract batches at 20 URLs. If there are more candidates, dedupe, rank by source authority and relevance, then process in batches.
- Include prior assumptions in research prompts so the research does not spend time rediscovering known context.
- Report failed extraction or crawl results explicitly, especially for filings, transcripts, IR pages, or cited sources.

## Output

Return a concise investor brief:

- Executive summary
- Business overview
- Market and competitive position
- Recent developments
- Financial or operating signals when available
- Risks
- Catalysts and watch items
- Open diligence questions
- Sources

Do not provide personalized financial advice. State when source coverage is thin, stale, or incomplete.
