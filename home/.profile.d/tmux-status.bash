#!/bin/bash
# tmux-status --- show what the current tmux status

# Mike Barker <mike@thebarkers.com>
# September 30th 2016

if [[ "$(command -v tmux)" ]] && [ -z "${TMUX}" ]; then
    if data=$(tmux ls 2>/dev/null); then
        printf "tmux sessions:\n%s" "$data"
    fi
fi
