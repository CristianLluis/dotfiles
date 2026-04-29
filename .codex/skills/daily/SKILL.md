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
9. If `projects/work/Pflanzen Büro/Giessen Kalender.md` exists, read it and the plant notes in the same folder, excluding `Giessen Kalender.md`.
10. For each plant note, find the most recent logged watering date in `Giessen Kalender.md`, derive today's reminder threshold from the plant's current-season watering cadence, and skip plants with no logged date instead of inventing one. Use `March-September` for Frühling/Sommer and `October-February` for Herbst/Winter. When a cadence is a range, use the earliest day as the reminder threshold.
11. If one or more plants are due today, add one unchecked item under `## Plan` listing them with wikilinks, for example `- [ ] Pflanzen Büro prüfen/giessen: [[Monstera]], [[Efeu Tute]]`. Do not duplicate an existing watering reminder.
12. When plants are due today and added to the daily note, also update `projects/work/Pflanzen Büro/Giessen Kalender.md` immediately so the same plants are not picked up again on the next daily run:
- ensure a `## YYYY-MM-DD` heading exists for today
- add the due plant wikilinks under today's heading
- preserve existing calendar entries and do not duplicate plant links already listed under today's heading
13. Preserve the structure from the existing note or from `templates/daily.md`; do not add, remove, or rename sections on your own.
14. Report the note path, the items carried forward, any plants due today, and whether `Giessen Kalender.md` was updated.

## Guardrails

- Do not rewrite the previous daily note unless the user explicitly asks.
- If there is no prior daily note, create today's note with an empty plan rather than fabricating carry-forwards.
- Only update `Giessen Kalender.md` for plants the skill determined are due and added to today's daily note.
- Preserve wikilinks and Markdown task syntax exactly.
