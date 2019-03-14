#!/bin/bash
# 10-header-fortune.bash --- print out a random fortune, use cowsay if installed

# This script will check for the fortune program and use it to
# retrieve a random fortune to be displayed.

# If the cowsay program is installed, cowsay will be used to print
# the fortune.

# If a cow file is provided, then it will be used instead.

# If the cow file selected or requested is in the _BAD_COWS
# array, it will be replaced with the default.cow file.

# parameters:
# -c <cow file>

# Mike Barker <mike@thebarkers.com>
# November 11th, 2016

# MRB 2018.06.11
# Fix bug when no shuffle program instaled.
# if no shuffle program always use the default cow.

# 2019-03-14 MRB
# Remove the dependance on gshuf/shuf program to select a random cow.
# Cleanup syntax warnings/errors using shellcheck linter.

_COWFILE=""
_BAD_COWS=("bong.cow sodomized.cow telebears.cow head-in.cow")

__cows_replace_bad_cowfile() {
    local cowfile=$1
    if [[ "${_BAD_COWS[*]}" =~ $1 ]]; then
        cowfile="default.cow"
    fi
    echo ${cowfile}
}

__cows_get_cowpath() {
    local cowpath=""
    if [[ "$(uname)" = "Darwin" ]]; then
        cowpath=/usr/local/share/cows
    else
        cowpath=/usr/share/cowsay/cows
    fi
    echo ${cowpath}
}

__cows_get_cowfile() {
    local cows cowpath cowfile
    cowfile="default.cow"
    if [[ "$_COWFILE" ]]; then
        cowfile=$_COWFILE   
    else
        cowpath=$(__cows_get_cowpath)
        cows=("${cowpath}"/*.cow)
        num_cows=${#cows[@]}
        rnd_cow_id=$((RANDOM % num_cows))
        cowfile=$(basename "${cows[$rnd_cow_id]}")
    fi
    printf "%s" "$(__cows_replace_bad_cowfile "${cowfile}")"
}

# parse commandline
OPTIND=1    # Index into options, reset to start at first option
while getopts ":c:" opt; do
    case $opt in
        c)
            _COWFILE=$OPTARG
            ;;
        *)
            ;;
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift

# if fortune is installed
if type fortune >/dev/null 2>&1; then
    echo
    # if cowsay is installed
    if [[ $(command -v cowsay) ]]; then
        [ "${DEBUG}" ] && echo "fortune -s | cowsay -f $(__cows_get_cowpath)/$(__cows_get_cowfile)" >&2
        fortune -s | cowsay -f "$(__cows_get_cowpath)"/"$(__cows_get_cowfile)"
    else
        [ "${DEBUG}" ] && echo "fortune -s" >&2
        fortune -s
    fi
    echo
fi
