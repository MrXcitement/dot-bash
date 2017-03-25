# 10-header-fortune.bash --- print out a random fortune, use cowsay if installed

# This script will check for the fortune program and use it to
# retrieve a random fortune to be displayed.

# If the cowsay program is installed, cowsay will be used to print
# the fortune with a random cow selected.

# If a cow file is provided, then it will be used instead of a random
# cow file instead.

# If the cow file selected or requested is in the _BAD_COWS
# array, it will be replaced with the default.cow file.

# parameters:
# -c <cow file>

# Mike Barker <mike@thebarkers.com>
# November 11th, 2016

_COWFILE=""
_BAD_COWS=("sodomized.cow telebears.cow head-in.cow")

replace_bad_cowfile() {
    local cowfile=$1
    if [[ " ${_BAD_COWS[@]} " =~ " $1 " ]]; then
        cowfile="default.cow"
    fi
    echo ${cowfile}
}

get_shuffle() {
    local shuffle=""
    if [[ "$(uname)" = "Darwin" ]]; then
        shuffle=gshuf
    else
        shuffle=shuf
    fi
    echo ${shuffle}
}

get_cowpath() {
    local cowpath=""
    if [[ "$(uname)" = "Darwin" ]]; then
        cowpath=/usr/local/share/cows
    else
        cowpath=/usr/share/cowsay/cows
    fi
    echo ${cowpath}
}

get_cowfile() {
    if [[ "$_COWFILE" = "" ]]; then
        cowfile=$(ls $(get_cowpath)/*.cow | \
                  xargs -n1 basename | \
                  $(get_shuffle) -n1)
    else
        cowfile=$_COWFILE
    fi
    echo ${cowfile}
}

# parse commandline
OPTIND=1    # Index into options, reset to start at first option
while getopts ":c:" opt; do
    case $opt in
        c)
            _COWFILE=$OPTARG
            ;;
    esac
done
shift $((OPTIND-1))
[ "$1" = "--" ] && shift
[ $DEBUG ] && echo "Cowfile: ${_COWFILE}"

# if fortune is installed
if type fortune >/dev/null 2>&1; then
    echo
    # if cowsay is installed
    if type cowsay >/dev/null 2>&1; then
        [ $DEBUG ] && echo "fortune -s | cowsay -f $(get_cowpath)/$(replace_bad_cowfile $(get_cowfile))"
        fortune -s | cowsay -f $(get_cowpath)/$(replace_bad_cowfile $(get_cowfile))
    else
        [ $DEBUG ] && echo "fortune -s"
        fortune -s
    fi
    echo
fi