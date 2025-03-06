#!/bin/bash

# Required: uv (python/venv/all in one)
# https://github.com/astral-sh/uv
# Install: curl -LsSf https://astral.sh/uv/install.sh | sh

# Directory to store all virtual environments
VENV_DIR="$HOME/virtualenvs"

# Ensure the virtualenvs directory exists
mkdir -p "$VENV_DIR"

# Function to create a virtual environment using uv
mkvenv() {
    if [ -z "$1" ]; then
        echo "Usage: mkvenv <venv_name>" >&2
        return 1
    fi

    local venv_name="$1"
    local venv_path="$VENV_DIR/$venv_name"

    if [ -d "$venv_path" ]; then
        echo "Virtual environment '$venv_name' already exists." >&2
    else
        echo "Creating virtual environment '$venv_name'..."
        uv venv "$venv_path"
        if [ $? -ne 0 ]; then  # Check for errors from uv
          echo "Error: Failed to create virtual environment." >&2
          return 1
        fi
        echo "Virtual environment '$venv_name' created at $venv_path."
    fi

    # Activate message
    echo "To activate, use: venv $1"
}

# Function to activate a virtual environment (no change needed)
workon() {
    local venv_name
    if [ -z "$1" ]; then
        # If no argument, use the current directory name as the venv name
        venv_name=$(basename "$(pwd)")
    else
        venv_name="$1"
    fi

    local venv_path="$VENV_DIR/$venv_name"

    if [ -d "$venv_path" ]; then
        echo "Activating virtual environment '$venv_name'..."
        source "$venv_path/bin/activate"
    else
        echo "Virtual environment '$venv_name' does not exist." >&2
        echo "Try running in your project folder or see your venv's with: lsvenv" >&2
    fi
}

# Function to remove a virtual environment (no major change needed)
rmvenv() {
    if [ -z "$1" ]; then
        echo "Usage: rmvenv <venv_name>" >&2
        return 1
    fi

    local venv_name="$1"
    local venv_path="$VENV_DIR/$venv_name"

    if [ -d "$venv_path" ]; then
        read -rp "Are you sure you want to delete '$venv_name'? (y/N): " confirm  # -r for raw input
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            echo "Deleting virtual environment '$venv_name'..."
            rm -rf "$venv_path"
            echo "Virtual environment '$venv_name' deleted."
        else
            echo "Deletion canceled."
        fi
    else
        echo "Virtual environment '$venv_name' does not exist." >&2
    fi
}

# Function to list all virtual environments (no change needed)
lsvenv() {
    echo "Available virtual environments in $VENV_DIR:"
    ls -1 "$VENV_DIR"
}

# Tab completion for workon and rmvenv (no change needed)
_workon_completions() {
    local cur
    cur="${COMP_WORDS[COMP_CWORD]}"

    # Get a list of virtual environment names
    local venv_names
    mapfile -t venv_names < <(ls -1 "$VENV_DIR" 2>/dev/null)

    # Filter matches using compgen
    local matches
    mapfile -t matches < <(compgen -W "${venv_names[*]}" -- "$cur")

    if [[ ${#matches[@]} -eq 1 ]]; then
        # If there's only one match, set it explicitly and disable further expansion
        COMPREPLY=("${matches[0]}")
        compopt -o nospace  # Prevents appending extra space
        compopt +o default   # Disables default Bash completion behavior
    elif [[ ${#matches[@]} -gt 1 ]]; then
        # If multiple matches, allow normal cycling
        COMPREPLY=("${matches[@]}")
    else
        COMPREPLY=()
    fi
}

# shorter alias to activate a venv.
venv() {
  workon "$@"
}


complete -F _workon_completions workon
complete -F _workon_completions rmvenv
complete -F _workon_completions venv # Add completion for the venv alias
