#!/bin/bash
# functions.bash --- system wide utility functions
# Mike Barker <mike@thebarkers.com>
# March 8th, 2017

# change the current terminal's title (or tab title)
function title {
    echo -ne "\033k${*}\033\\"
}

# make a directory and then change into it
function mkcd {
    mkdir -p "$@"
    cd "$@" || exit
}

# check if element is in array
in_array() {
    local array, element
    array="${1}[@]"
    element="${2}"
    for i in ${!array}; do
        if [[ ${i} == "${element}" ]]; then
            return 0
        fi
    done
    return 1
}
