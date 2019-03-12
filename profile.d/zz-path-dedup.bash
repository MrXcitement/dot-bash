#!bash
# zz-path-dedup.bash --- Clean duplicates from the PATH

# Mike Barker <mike@thebarkers.com>
# March 12th 2019

# Requires: awk
# See: https://unix.stackexchange.com/questions/14895/duplicate-entries-in-path-a-problem

PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')
