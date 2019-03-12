# homebrew.bash --- Configure the homebrew package system

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 13th, 2015

# History:
# 2017-10-26
# * First release.

# Only if on an OSX system and homebrew installed
SYSTEM=$(uname -s)
if [[ "$SYSTEM" == "Darwin" && $(command -v brew) ]]; then
    [ ${DEBUG} ] && echo "...Configuring homebrew cask options" >&2
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi
