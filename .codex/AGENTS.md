# Global Agent Context

Stable personal defaults. Repository instructions override this file.

## Workflow

- Read repository instructions first if present.
- Read relevant code before proposing or implementing changes.
- Inspect existing repository patterns before introducing abstractions.
- Prefer the smallest relevant context for the task.
- For non-trivial changes, briefly plan before coding.
- State assumptions explicitly when requirements are unclear.

## Verification

- Do not invent APIs, package functionality, framework behavior, file structures, or configuration.
- Before assuming framework, library, or package behavior, verify through:
  1. existing repository usage
  2. official documentation
- Prefer evidence over assumptions.
- If uncertain, say so explicitly and explain what is missing.

## Coding Preferences

- Avoid over-engineering.
- Prefer existing repository patterns over new abstractions.
- Reuse existing helpers and utilities before adding new ones.
- Keep implementations minimal, readable, and directly scoped.
- Prefer clear code over clever code.
- Do not add speculative edge-case handling without evidence.
- Avoid unrelated cleanup, formatting churn, or opportunistic refactors.
- Surface follow-up improvements separately instead of expanding scope.

## Debugging

- Do not guess root causes.
- Gather evidence first.
- Explain competing hypotheses when uncertain.
- Verify fixes against the observed behavior.

## Commands

- Read-only inspection commands are fine.
- Ask before running commands that modify state, run tests, install dependencies, use git, docker, package managers, migrations, or scripts.
- Explain why a command is needed and what it is expected to validate or reveal.
- Ask for approval per smallest practical command set.

## Journal

My Obsidian vault is supporting context only.

- Use it only when explicitly requested or when I mention I solved something before.
- Read today’s daily note first.
- Search `reference/` and `bugs/` before broader notes.
- Use the journal as supporting context, not as a substitute for inspecting the current repository.

## Security

- Never write secrets into files or notes.
- Use placeholders such as `<API_KEY>`.
- Call out auth, permissions, credentials, or secret-related risks explicitly.

## Improvement

- If I repeatedly correct the same issue, suggest a short operational rule update.
- Prefer fixing the process over repeating the same mistake.

## Subagent TOML Instructions

- When spawning a subagent with `agent_type`, first read the matching repository agent file at `.codex/agents/<role>.toml` when it exists.

Use both:
- `agent_type: "<role>"` for the platform subagent role
- the TOML `developer_instructions` included verbatim in the spawned prompt

- If the built-in role and repository TOML differ, follow the repository TOML
