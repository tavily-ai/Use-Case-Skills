---
name: investment-research
description: Produce investment research, portfolio intelligence, company or sector briefs, earnings/news synthesis, market thesis support, risk and catalyst analysis, and investor-style reports. Use when the user asks for investment research, portfolio monitoring, sector analysis, public/private company diligence, comparable companies, or a source-grounded investment memo.
---

# Investment Research

## Workflow

This is the one skill where Tavily research is often justified because investor workflows need synthesis across many sources. Still choose the fastest path that fits the request.

1. Determine whether the user needs a quick source check or a full investment brief.
2. For quick checks, use `tvly search` and `tvly extract` on filings, earnings pages, investor relations pages, reputable financial media, company pages, and market sources.
3. For full reports, use `tvly research "<company or sector> investment research risks catalysts market position" --model pro` or `--model auto`.
4. Use extract after research when a specific cited source needs verification.
5. Keep the final answer grounded in cited sources and label any judgment as analysis.

## Endpoint Selection

- Use `search + extract` for recent news, specific claims, filings, earnings snippets, and source verification.
- Use `research` for deep company memos, sector analysis, competitive landscape, risk/catalyst synthesis, or multi-angle comparisons.
- Avoid crawl unless the user asks to collect many investor relations, filings, or company pages.

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
