#!/bin/bash
# function-gitignore.bash --- Download gitignore templates from gitignore.io
# Mike Barker <mike@thebarkers.com>
# May 7th, 2019

# https://docs.gitignore.io

function gi() {
    IFS=","
    curl -sL https://www.gitignore.io/api/"$*"
}
