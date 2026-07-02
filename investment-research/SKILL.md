---
name: investment-research
description: Produce investment research, portfolio intelligence, company or sector briefs, earnings/news synthesis, market thesis support, risk and catalyst analysis, and investor-style reports. Use when the user asks for investment research, portfolio monitoring, sector analysis, public/private company diligence, comparable companies, or a source-grounded investment memo.
---

# Investment Research

## Workflow

This is the one skill where Tavily research is often justified because investor workflows need synthesis across many sources. Still choose the fastest path that fits the request.

1. Determine whether the user needs a quick source check or a full investment brief.
2. For quick checks, split into short sub-queries for filings, earnings, guidance, recent developments, market position, risks, catalysts, and competitors.
3. Use `tvly search` and `tvly extract` on filings, earnings pages, investor relations pages, reputable financial media, company pages, and market sources.
4. For full reports, use Tavily research with a clear goal, known context, geography, timeframe, target market, and desired output. Use `model=pro` for comprehensive multi-angle analysis and `model=mini` for narrow questions.
5. Use extract after research when a specific cited source, metric, quote, or claim needs verification.
6. Keep the final answer grounded in cited sources and label any judgment as analysis.

## Endpoint Selection

- Use `search + extract` for recent news, specific claims, filings, earnings snippets, and source verification.
- Use `research` for deep company memos, sector analysis, competitive landscape, risk/catalyst synthesis, or multi-angle comparisons.
- Avoid crawl unless the user asks to collect many investor relations, filings, or company pages.

## Parameter Guidance

- Use `topic=finance` for finance-oriented discovery when available; use `topic=news` plus `time_range` for recent developments.
- Use `search_depth=advanced` for exact financial metrics, management quotes, filings, company-specific claims, or comparable-company details.
- Use domain filters for high-trust sources such as company investor relations sites, SEC/filing domains, exchange pages, regulators, and reputable financial publications.
- Use extract with a focused `query` and `chunks_per_source=3` for long filings, transcripts, and reports.
- When using research, include prior known assumptions so the report does not spend time rediscovering context.
- Use structured output only if the user needs a machine-readable table or pipeline-ready fields; otherwise produce a readable memo.

## Output

Use this structure unless the user asks otherwise:

- Executive summary
- Business overview
- Market and competitive position
- Recent developments
- Financial or operating signals when available
- Key risks
- Catalysts or watch items
- Open diligence questions
- Sources

Do not give personalized financial advice. State when source coverage is thin, stale, or incomplete.
