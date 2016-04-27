#!/bin/sh

# hub.sh --- configure the github wrapper for git
# https://hub.github.com/

# Mike Barker <mike@thebarkers.com>
# Created April 26th 2016

# Only alias the hub command to git if it exists.
if command -v hub >/dev/null 2>&1; then
	eval $(hub alias -s)
fi
