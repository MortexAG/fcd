#!/bin/bash

fcd() {
  # display help message if --help is passed
  if [[ "$1" == "--help" ]]; then
    echo "usage: fcd [options] search_term"
    echo
    echo "fuzzy change directory - quickly navigate directories using fzf and fdfind."
    echo
    echo "options:"
    echo "  -d n       limit search depth to n levels."
    echo "  -r         start search from root directory."
    echo "  --help     show this help message and exit."
    echo
    echo "examples:"
    echo "  fcd projects       # search for 'projects' directory"
    echo "  fcd -d 2 projects  # search for 'projects' but limit depth to 2"
    echo "  fcd -r projects    # search for 'projects' starting from the root"
    echo "for more usage:"
    echo "  fdfind --help"
    return 0
  fi

  # capture all optional arguments before the search term
  local search_term
  local args=()
  local start_dir="~"

  while [[ $# -gt 0 ]]; do
    case "$1" in
    -r)
      start_dir="/"  # set start directory to root when -r is passed
      shift
      ;;
    -*)
      args+=("$1" "$2")
      shift 2
      ;; # capture options like `-d 2`
    *)
      search_term="$1"
      shift
      ;; # capture the search term
    esac
  done

  # run fd with optional arguments + search term, starting from the selected directory
  cd "$(fd -t d "${args[@]}" "$search_term" "$start_dir" | fzf)"
}

