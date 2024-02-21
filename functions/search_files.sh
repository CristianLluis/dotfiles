# used during file formatting and linting to look for debugging code
_search_files() {
    local error_found=0

    # searches for .only() in cypress files
    search_for_only() {
        local search_directory="./frontend/test"

        # Function to search for ".only" in .cy.js files using find
        search_cyjs_files() {
            local directory="$1"
            local cyjs_files=($(find "$directory" -type f -name "*.cy.js"))
            for file in "${cyjs_files[@]}"; do
                if grep -q -E '\.only' "$file"; then
                    echo "Error: Found '.only' in file '$file'"
                    error_found=1
                fi
            done
        }

        # Start the search in the specified directory
        search_cyjs_files "$search_directory"
    }

    # searches for debugger() in .js and .vue files
    search_for_debugger() {
        local search_directory="./frontend"

        # Function to search for "debugger" in .js and .vue files using find
        search_js_vue_files() {
            local directory="$1"
            local js_vue_files=($(find "$directory" \( -type d \( -name node_modules -o -name .nuxt \) -prune -false -o -type f \( -name "*.js" -o -name "*.vue" \) \)))
            for file in "${js_vue_files[@]}"; do
                if grep -q "debugger" "$file"; then
                    echo "Error: Found 'debugger' in file '$file'"
                    error_found=1
                fi
            done
        }

        # Start the search in the specified directory
        search_js_vue_files "$search_directory"
    }

    # searches for breakpoint() in .py files
    search_for_breakpoint() {
        local search_directory="./backend"

        # Function to search for "breakpoint()" in .py files using find
        search_py_files() {
            local directory="$1"
            local py_files=($(find "$directory" -type f -name "*.py"))
            for file in "${py_files[@]}"; do
                if grep -q "breakpoint()" "$file"; then
                    echo "Error: Found 'breakpoint()' in file '$file'"
                    error_found=1
                fi
            done
        }

        # Start the search in the specified directory
        search_py_files "$search_directory"
    }

    search_for_breakpoint
    search_for_debugger
    search_for_only

    if [ "$error_found" -eq 1 ]; then

    else
        echo "All good!"
    fi
}
