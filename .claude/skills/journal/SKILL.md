---
name: journal
description: Create a session note in the Obsidian vault summarizing the current Claude Code session
---

Create a session note in the Obsidian vault at `/Users/cris/repos/obsidian-vaults/Cristian/` that summarizes this Claude Code session.

Follow these steps:

1. **Load vault context**: Read `/Users/cris/repos/obsidian-vaults/Cristian/CLAUDE.md` for vault structure and conventions.

2. **Determine the session filename**: Use the format `YYYY-MM-DD-<short-topic>.md` based on today's date and the main topic of this session. Example: `2026-04-09-vault-setup.md`.

2. **Create the session note** at `sessions/<filename>` using this structure:

```markdown
---
created: <today's date YYYY-MM-DD>
type: session
tags: [session]
project: 
ticket: 
status: complete
---

# Session: <descriptive title>

## Goal
<what was the goal of this session>

## What changed
<files created, modified, or deleted — be specific>

## Decisions made
<key decisions and why>

## Dead ends
<approaches that didn't work and why>

## Open questions
<unresolved questions or things to investigate>

## Next steps
- [ ] <concrete next actions>
```

4. **Update today's daily note** at `daily/<YYYY-MM-DD>.md`:
   - If it exists, append a wikilink to the session note under the `## Sessions` section.
   - If it doesn't exist, just note that in your response — don't create it automatically.

5. **Report back** with the session note filename and a one-line summary of what was logged.
