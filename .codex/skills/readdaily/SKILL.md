---
name: readdaily
description: Read today's daily note in Cristian's Obsidian dev journal. Use when the user asks to read today's daily note, load today's journal context, or inspect the current daily note. If the note does not exist, say that today's daily note does not exist.
---

# Read Daily

Use this skill for the vault at `/Users/cris/repos/obsidian-vaults/Cristian/`.

## Workflow

1. Determine today's date from session context and format it as `YYYY-MM-DD`.
2. Build the note path `daily/YYYY-MM-DD.md`.
3. If the note exists, read it fully.
4. Use the note content as context for the current task or return it when the user explicitly asks to read it.
5. If the note does not exist, say that today's daily note does not exist.

## Guardrails

- Do not create, update, or delete any note.
- Do not fabricate note contents when the file is missing.
- Prefer reading the single daily note only; do not scan other journal files unless the user asks.
