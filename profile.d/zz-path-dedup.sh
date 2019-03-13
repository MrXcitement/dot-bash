#!/bin/sh
# zz-path-dedup.bash --- Clean duplicates from the PATH

# Mike Barker <mike@thebarkers.com>
# March 12th 2019

# Requires: awk
# See: https://unix.stackexchange.com/questions/14895/duplicate-entries-in-path-a-problem

PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!($0 in a) {a[$0]; printf("%s%s", length(a) > 1 ? ":" : "", $0)}')
