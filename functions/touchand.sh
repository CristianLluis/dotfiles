touchand() {
    if ! [ "$1" ]; then
        echo "need a file!" >&2
        return 1
    fi
    : > "$1" && vi "$1"
}
