#short for code. used to open vscode
c() {
    case "$1" in
        --help | -h)
            echo "Usage: c [path]"
            echo "  path: Path to file or directory to open in Visual Studio Code."
            echo "  If no path is provided, opens the current directory."
            ;;
        "")
            code .
            ;;
        *)
            if [ "$#" -gt 1 ]; then
                echo "Error: Only one argument allowed"
                return 1
            fi
            if [ ! -e "$1" ]; then
                echo "Error: Invalid path '$1'"
                return 1
            fi
            code "$1"
            ;;
    esac
}
