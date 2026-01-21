PRECO_PLUGIN_DIR="${${(%):-%x}:A:h}"
typeset -g PRECO_PROJECTS_DIR="$PRECO_PLUGIN_DIR/projects"

preco() {
    local repo_root repo_name script
    repo_root=$(git rev-parse --show-toplevel 2>/dev/null)
    [[ -z "$repo_root" ]] && repo_root="$PWD"

    repo_name="${repo_root:t}"
    script="$PRECO_PROJECTS_DIR/${repo_name}.sh"

    if [[ -f "$script" ]]; then
        (cd "$repo_root" && zsh "$script" "$@")
    else
        echo "preco: no project script configured for '${repo_name}'. Add one at $script."
        return 1
    fi
}
