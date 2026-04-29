---
name: weekly
description: Create or update a weekly summary in Cristian's Obsidian dev journal using the weekly template, grounded in that week's daily notes and the session notes they link to. Use when the user asks to create a weekly note, summarize last week, or roll up a week of coding work.
---

# Weekly

Use this skill for the vault at `/Users/cris/repos/obsidian-vaults/Cristian/`.

## Workflow

1. Determine the target ISO week.
- If the user says "last week", use the previous completed ISO week from session context.
- If the user gives a specific week or date range, use that instead.
2. Determine the weekly note path: `weekly/YYYY-Www.md`.
3. Read `weekly/YYYY-Www.md` if it already exists.
4. Read `templates/weekly.md` and render its placeholders manually when creating a new note.
5. Read the daily notes for Monday through Friday of that ISO week.
- Use existing notes only; do not invent missing days.
- Extract completed work, open items, blockers, and end-of-day carry-forwards.
6. Follow all session links listed in those daily notes and read every linked session note before writing the weekly summary.
- The daily note link is the source of truth for relevance, regardless of the linked session note's filename date.
- Prefer `Goal`, `What changed`, `Decisions made`, `Open questions`, and `Next steps`.
7. Read decision notes or bug notes only when they are linked from the week's daily or session notes, or when the user explicitly asks for them.
8. Create or update the weekly note with this structure:
- frontmatter
- `## Days`
- `## Highlights`
- `## Shipped`
- `## Decisions made`
- `## Carry forward`
- `## Retro`
9. For `## Days`, follow the weekly template and list Monday through Friday as wikilinks for that ISO week.
10. Write the summary with these priorities:
- `Highlights`: what mattered most, major threads, meaningful progress, notable customer or project outcomes
- `Shipped`: concrete completed work, merged or verified changes, bugs fixed, tasks finished
- `Decisions made`: implementation or process decisions that changed what happens next
- `Carry forward`: unfinished work, blockers, open questions, explicit next verification steps
- `Retro`: short, blameless reflection with one practical improvement to try next week
11. Keep the entry concise and high signal.
- Include outcomes, decisions, blockers, and next actions.
- Skip minute-by-minute logs, raw command output, duplicate restatements from every daily note, speculative filler, and blame.
12. If the weekly note already exists, merge new bullets without duplicating existing content and preserve unrelated user edits.
13. Report the weekly note path and the daily/session notes used as source material.

## Guardrails

- Do not invent accomplishments, PRs, tests, decisions, or blockers that are not supported by the notes.
- Do not rewrite daily notes or session notes unless the user explicitly asks.
- Preserve wikilinks and Markdown list formatting.
- If the week has sparse notes, say so implicitly through a lighter summary rather than fabricating completeness.
- Prefer concrete bullets over long prose.
