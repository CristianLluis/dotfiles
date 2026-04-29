# Global Agent Context

## Who I Am

Software developer working across multiple projects with varying stacks.

- Frontend: Vue 2 and Vue 3, Vuetify, Nuxt
- Backend: Python, mainly Django, with some FastAPI
- Some projects include microservices such as WeasyPrint, Tika, IIIF file processing, RabbitMQ, Celery, and Mosquitto
- Storage: S3-compatible systems, usually local Minio in development and Exoscale buckets in production
- Local development: Docker Compose on OrbStack

## Session Start

At the start of every session:

- Read today's daily note from `/Users/cris/repos/obsidian-vaults/Cristian/daily/`, using the current date in `YYYY-MM-DD.md` format, and use it as current working context if it exists.
- If today's daily note does not exist, note that clearly instead of assuming context.
- Treat `/Users/cris/repos/obsidian-vaults/Cristian/` as my dev journal and knowledge base.

## Journal Usage

- When I ask to check my journal, read today's daily note first.
- When I say I solved something before, search `reference/` and `bugs/` first.
- Use `sessions/` for session logs, `projects/work/` and `projects/personal/` for project notes, and `decisions/` for lightweight ADRs.
- Only search repo-specific notes by frontmatter tag when I explicitly ask for that.

## Coding

- Avoid over-engineering.
- Keep implementations minimal, tidy, and directly scoped to the task.
- Do not add defensive programming for speculative edge cases or unsupported scenarios unless there is concrete evidence it is needed.
- Do not assume requirements or hidden constraints. Verify from the code or ask when necessary.

## Security

- Never write secrets, passwords, API keys, tokens, or connection strings into notes.
- Use placeholders such as `<API_KEY>` or `<DB_PASSWORD>` instead.
