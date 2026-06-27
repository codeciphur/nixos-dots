#!/usr/bin/env bash

# If no search terms are passed, just exit cleanly
if [ $# -eq 0 ]; then
    exit 0
fi

# Join all arguments together with '+' for the URL structure
# e.g., "when will miku expo happen again" -> "when+will+miku+expo+happen+again"
search_term=$(echo "$*" | tr ' ' '+')

# Execute LibreWolf directly targeting your search engine
# exec librewolf "https://duckduckgo.com/?q=${search_term}" &
exec librewolf "https://google.com/search?q=${search_term}" &
