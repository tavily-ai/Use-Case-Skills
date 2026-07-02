---
name: academic-scientific-research
description: Find, screen, and synthesize academic papers, scientific literature, technical reports, preprints, clinical or biomedical publications, and evidence around a research question. Use when the user asks to find papers, summarize literature, compare methods, identify seminal or recent work, extract claims from studies, or build a source-grounded academic/scientific evidence brief.
---

# Academic Scientific Research

## Workflow

Use search and extract for most tasks. Reserve slower research only for full literature review requests.

1. Translate the user's question into search terms, synonyms, key entities, and likely source domains.
2. Use `tvly search` with domain filters when appropriate, such as arxiv.org, pubmed.ncbi.nlm.nih.gov, nih.gov, nature.com, science.org, acm.org, ieee.org, or scholar-friendly publisher pages.
3. Use `tvly extract` on abstracts, full text pages, preprints, review articles, guidelines, or publisher pages.
4. Use `tvly research` only when the user explicitly asks for a full literature review or broad multi-source synthesis.
5. Distinguish primary studies, review papers, preprints, editorials, guidelines, and news coverage.

## Endpoint Selection

- Use `search + extract` for finding papers, reading abstracts, comparing a small set of studies, and extracting claims.
- Use `research` for broad literature reviews, research landscapes, and multi-method comparisons.
- Use `map` only for navigating a known lab, journal, conference, or documentation site.
- Use `crawl` only when collecting many pages from a known source, such as proceedings, a lab publication list, or a technical docs section.

## Output

Return an evidence brief with:

- Research question
- Search strategy and inclusion logic
- Key papers or sources with URLs
- Findings grouped by theme
- Methods, sample/data, and limitations where available
- Consensus, disagreement, and evidence gaps
- Suggested follow-up queries

For medical, clinical, or biomedical topics, be conservative: do not provide diagnosis or treatment advice, and prioritize primary literature, systematic reviews, guidelines, and official health sources.
