#!/usr/bin/env zsh
set -euo pipefail

project_name="oikos"

typeset -gi PRECO_FAILED=0

have_cmd() { command -v "$1" >/dev/null 2>&1; }
have_file() { [[ -f "$1" ]]; }
have_dir() { [[ -d "$1" ]]; }

backend_checks() {
  if ! have_dir backend; then
    echo "preco(${project_name}): backend/ directory not found (skipping)"
    PRECO_FAILED=1
    return
  fi

  if ! have_file ./venv/bin/python; then
    echo "preco(${project_name}): no venv found at ./venv (skipping backend tools)"
    PRECO_FAILED=1
  fi

  if have_file ./venv/bin/flake8; then
    (cd backend && ../venv/bin/flake8) || PRECO_FAILED=1
    [[ $? -eq 0 ]] && echo "✓ flake8 pretty clean ✨"
  else
    echo "preco(${project_name}): flake8 not installed (skipped)"
    PRECO_FAILED=1
  fi

  if have_file ./venv/bin/isort; then
    (cd backend && ../venv/bin/isort --check-only --quiet --settings ../pyproject.toml .) || PRECO_FAILED=1
    [[ $? -eq 0 ]] && echo "✓ isort happy 😊"
  else
    echo "preco(${project_name}): isort not installed (skipped)"
    PRECO_FAILED=1
  fi

  if have_file ./venv/bin/black; then
    (cd backend && ../venv/bin/black --check .) || PRECO_FAILED=1
  else
    echo "preco(${project_name}): black not installed (skipped)"
    PRECO_FAILED=1
  fi

  matches="$(grep -r --include="*.py" -n -E "breakpoint\(\)|set_trace\(\)" ./backend/ 2>/dev/null || true)"
  if [[ -n "$matches" ]]; then
    echo "$matches"
    PRECO_FAILED=1
  else
    echo "✓ No breakpoint statements found 👀"
  fi
}

frontend_checks() {
  if ! have_dir frontend; then
    echo "preco(${project_name}): frontend/ directory not found (skipping)"
    PRECO_FAILED=1
    return
  fi

  have_cmd node || { echo "preco(${project_name}): node not found"; PRECO_FAILED=1; }
  have_cmd yarn || { echo "preco(${project_name}): yarn not found"; PRECO_FAILED=1; }

  only_matches="$(grep -r --include="*.cy.js" -n "test\.only\|it\.only\|describe\.only(" ./frontend/ 2>/dev/null || true)"
  if [[ -n "$only_matches" ]]; then
    echo "$only_matches"
    PRECO_FAILED=1
  else
    echo "✓ No .only() found 🔍"
  fi

  dbg_matches="$(
    grep -R --include="*.js" --include="*.vue" -n "debugger" ./frontend 2>/dev/null \
      | grep -vE '/node_modules/|/\.nuxt/|/dist/' || true
  )"

  if [[ -n "$dbg_matches" ]]; then
    echo "$dbg_matches"
    PRECO_FAILED=1
  else
    echo "✓ No debugger statements found 🕵️"
  fi

  if have_cmd yarn; then
    (cd frontend && yarn lint --quiet --cache) || PRECO_FAILED=1
  fi
}

# ---------------------------------------------------------------------------
# Run
# ---------------------------------------------------------------------------

backend_checks
frontend_checks

if (( PRECO_FAILED )); then
  echo "\npreco(${project_name}): finished with issues\n"
  exit 1
fi

echo "\npreco(${project_name}): finished clean ✅\n"
