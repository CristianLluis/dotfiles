# preco

Run project-specific clean-commit scripts.

- Call `preco` from a repository root; it resolves the git root (or `pwd`) and runs `projects/<repo>.sh` if present.
- If no script exists, it prints a notice and exits non-zero.
- Add projects by dropping a `zsh` script in `projects/` named after the repo directory (for example `projects/my-repo.sh`).
- Scripts execute inside the repo root, so relative paths work as expected.
- `projects/oikos.sh` mirrors the GitHub Actions lint steps (Cypress `.only`/`debugger`/`breakpoint` checks, backend isort/black/flake8/migrations/translation check/pytest, frontend eslint/i18n scan/translation checks, tests) using the testing docker-compose files when available.
