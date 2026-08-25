---
name: daily
description: Create or update today's daily note in Cristian's Obsidian dev journal, carrying forward unfinished tasks from the previous daily note. Use when the user asks to create today's note, prep the day, or carry open items forward.
---

# Daily

Use this skill for the vault at `/Users/cris/repos/obsidian-vaults/Cristian/`.

## Workflow

1. Determine today's date from session context and format it as `YYYY-MM-DD`.
2. Determine the previous workday note to inspect. Usually this is yesterday; if today is Monday, use the previous Friday when appropriate.
3. Read `daily/YYYY-MM-DD.md` if it already exists.
4. Read the most recent relevant prior daily note and extract carry-forwards:
- unchecked `- [ ]` plan items
- nested sub-items under unchecked plan items
- explicit content from the `Carry forward` line in `## End of day`
5. Never carry forward checked `- [x]` items.
6. Read `templates/daily.md` and render the template placeholders manually for today's date when creating a new note.
7. If today's note already exists, merge carry-forward items into `## Plan` without duplicating existing items and without disturbing unrelated user edits.
8. If today's note does not exist, create it with the rendered template and place carry-forward items under `## Plan`.
9. Preserve the structure from the existing note or from `templates/daily.md`; do not add, remove, or rename sections on your own.
10. Report the note path and the items carried forward.

## Guardrails

- Do not rewrite the previous daily note unless the user explicitly asks.
- If there is no prior daily note, create today's note with an empty plan rather than fabricating carry-forwards.
- Preserve wikilinks and Markdown task syntax exactly.
