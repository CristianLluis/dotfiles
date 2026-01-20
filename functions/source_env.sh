# Searches for a virtual env in /. and in /venv. Then activates it.
sc() {
    if source venv/bin/activate 2>/dev/null || source bin/activate 2>/dev/null|| source .venv/bin/activate 2>/dev/null; then
        # Virtual environment activated successfully
        return 0
    else
        # Virtual environment not found
        echo "Error: Virtual environment not found."
        return 1
    fi
}
