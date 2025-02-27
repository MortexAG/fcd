#!/bin/bash

fcd() {
    local search_term
    local args=()

    while [[ $# -gt 0 ]]; do
        case "$1" in
            -*) args+=("$1" "$2"); shift 2 ;; # Capture options like `-d 2`
            *) search_term="$1"; shift ;;     # Capture the search term
        esac
    done

    cd "$(fdfind -t d "${args[@]}" "$search_term" ~/ | fzf)"
}

# Make sure this function is available when sourced
export -f fcd

