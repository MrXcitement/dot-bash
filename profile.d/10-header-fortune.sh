# fotune.bash --- print out a random fortune, use cowsay if installed

# This script will check for the fortune program and use it to
# retrieve a random fortune to be displayed.

# If the cowsay program is installed, cowsay will be used to print
# the fortune with a random cow selected.

# If a cow file is provided, then it will be used instead of a random
# cow file instead.

# If the cow file randomly selected or requested is the sodomized.cow
# file, this script will replace it with the default.cow file.

# parameters:
# -c <cow file>

# Mike Barker <mike@thebarkers.com>
# November 11th, 2016

clean_cowfile() {
    cowfile=$1
    if [ "$1" == "sodomized.cow" ] ||
        [ "$1" == "telebears.cow" ] ||
        [ "$1" == "head-in.cow" ]; then
        cowfile="default.cow"
    fi
    echo ${cowfile}
}

get_shuffle() {
    if [ "$(uname)" == "Darwin" ]; then
        shuffle=gshuf
    else
        shuffle=shuf
    fi
    echo ${shuffle}
}
get_cowpath() {
    if [ "$(uname)" == "Darwin" ]; then
        cowpath=/usr/local/share/cows
    else
        cowpath=/usr/share/cowsay/cows
    fi
    echo ${cowpath}
}

get_cowfile() {
    if [ "$1" == "" ]; then
        cowfile=$(ls $(get_cowpath)/*cow | \
                  xargs -n1 basename | \
                  $(get_shuffle) -n1)
    fi
    echo $(clean_cowfile ${cowfile})
}

# parse commandline
_COWFILE="" # Need a cowfile
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

if type fortune >/dev/null 2>&1; then
    echo
    if type cowsay >/dev/null 2>&1; then
        [ $DEBUG ] && echo "fortune -s | cowsay -f $(get_cowpath)/$(get_cowfile)"
        fortune -s | cowsay -f $(get_cowpath)/$(get_cowfile)
    else
        [ $DEBUG ] && echo "fortune -s"
        fortune -s
    fi
    echo
fi
