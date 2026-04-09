---
name: daily
description: Create today's daily note in the Obsidian vault, carrying forward unfinished items from the previous day
---

Create today's daily note in the Obsidian vault at `/Users/cris/repos/obsidian-vaults/Cristian/`.

Follow these steps:

1. **Determine dates**: Today's date is available in context. The new note is for today. Also determine yesterday's date (or last Friday if today is Monday). Format: `YYYY-MM-DD`.

2. **Read the most recent daily note**: Look in `daily/` for the latest existing note (usually yesterday's). Read it fully.

3. **Extract carry-forwards** from the previous note:
   - All unchecked `- [ ]` plan items (and their sub-items)
   - Any explicit "Carry forward" entries from the End of day section
   - Do NOT carry forward checked items (`- [x]`)

4. **Check if today's note already exists** at `daily/<YYYY-MM-DD>.md`. If it does, read it and merge the carry-forwards into its Plan section (avoid duplicates). If it doesn't, create it fresh.

5. **Create or update today's daily note** using the template at `templates/daily.md`. Read the template, render all Templater expressions using today's date (`tp.file.title` = `YYYY-MM-DD`), remove the `<% tp.file.cursor() %>` placeholder, and insert carry-forward items under `## Plan`.

6. **Report back**: Confirm the filename created and list what was carried forward.
