#!/bin/sh
# zz-path-dedup.bash --- Clean duplicates from the PATH

# Mike Barker <mike@thebarkers.com>
# March 12th 2019

# Requires: awk
# See: https://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command

PATH=$(printf %s "$PATH" | awk -v RS=: -v ORS=: '!arr[$0]++')
