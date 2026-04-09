# Cristian's Global Context

## Who I am

Software developer. I work across multiple projects with varying stacks.

**Primary stack:**
- Frontend: Vue 2 and Vue 3 (depends on project), Vuetify, Nuxt
- Backend: Python — Django (primary), FastAPI (some projects)
- Some projects have microservices: WeasyPrint, Tika, IIIF file processing, RabbitMQ, Celery, Mosquitto (MQTT)
- Storage: S3-compatible — local Minio (dev), Exoscale buckets (prod)
- Local dev: Docker Compose on OrbStack

## Dev journal

My Obsidian vault lives at `~/repos/obsidian-vaults/Cristian/`. It is a dev journal and knowledge base. The SessionStart hook injects today's daily note automatically.

**Vault folders:**
- `daily/` — daily notes (YYYY-MM-DD.md)
- `sessions/` — Claude Code session logs
- `projects/work/` — work project notes
- `reference/` — evergreen solutions and patterns (search here first for past solutions)
- `bugs/` — bug investigations with root cause and fix
- `decisions/` — lightweight ADRs

**Finding project-specific notes:**
Notes in the vault are tagged with the repo name they belong to. Tags are in the YAML frontmatter at the top of each file:

```
---
tags:
  - python
  - postgres
---
```

When asked to search for notes related to a repo, search only in frontmatter using:

```
grep -rl "^  - <repo-name>$" ~/repos/obsidian-vaults/Cristian/ --include="*.md"
```

Only do this when explicitly asked. Do not search the vault proactively.

## Security

- **Never write real secrets into notes** — no passwords, API keys, tokens, connection strings, or private keys.
- Use placeholders instead: `<DB_PASSWORD>`, `<API_KEY>`, `<SECRET_TOKEN>`.
- If you spot a secret in an existing note, flag it immediately and replace it with a placeholder.
- The vault is in a git repo. Anything written there could end up in version history.
