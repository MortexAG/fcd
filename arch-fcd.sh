#!/bin/bash

fcd() {
    # Display help message if --help is passed
    if [[ "$1" == "--help" ]]; then
        echo "Usage: fcd [OPTIONS] SEARCH_TERM"
        echo
        echo "Fuzzy Change Directory - Quickly navigate directories using fzf and fdfind."
        echo
        echo "Options:"
        echo "  -d N       Limit search depth to N levels."
        echo "  --help     Show this help message and exit."
        echo
        echo "Examples:"
        echo "  fcd projects       # Search for 'projects' directory"
        echo "  fcd -d 2 projects  # Search for 'projects' but limit depth to 2"
        echo "For more usage:"
        echo "  fdfind --help"
        return 0
    fi

    # Capture all optional arguments before the search term
    local search_term
    local args=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -*) args+=("$1" "$2"); shift 2 ;; # Capture options like `-d 2`
            *) search_term="$1"; shift ;;     # Capture the search term
        esac
    done

    # Run fd with optional arguments + search term
    cd "$(fd -t d "${args[@]}" "$search_term" ~/ | fzf)"
}
