---
name: journal
description: Create a session note in Cristian's Obsidian dev journal and link it from today's daily note. Use when the user asks to log the session, journal current work, or create a session note.
---

# Journal

Use this skill for the vault at `/Users/cris/repos/obsidian-vaults/Cristian/`.

## Workflow

1. Determine today's date from session context and choose a concise topic slug for the filename.
2. Create the session note at `sessions/YYYY-MM-DD-<short-topic>.md`.
3. Read `templates/session.md` and render its placeholders manually when creating the note.
4. Capture the current session with the template structure and include, when relevant:
- goal
- context given to the model
- key interactions
- what changed
- decisions made
- dead ends
- open questions
- next steps
5. Use wikilinks for related notes where that adds value.
6. If today's daily note exists at `daily/YYYY-MM-DD.md`, add a bullet for the new session note under `## Sessions`.
7. Avoid duplicate backlinks if the session note is already listed.
8. If today's daily note does not exist, do not create it unless the user explicitly asked for that too.
9. Report the session note path and a concise one-line summary of what was logged.

## Guardrails

- Do not invent commits, tests, or files that were not actually part of the session.
- Preserve existing user content in today's daily note when adding the session link.
- Prefer short, descriptive slugs such as `vault-setup`, `oikos-review`, or `auth-debugging`.
