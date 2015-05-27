# homebrew-cask.bash --- Configure the cask app package system

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 13th, 2015

# History:
# 2015.05.13
# * First release.

# Only if on an OSX system
SYSTEM=$(uname -s)
if [ "$SYSTEM" == "Darwin" ]; then
    [ $DEBUG ] && echo "Configuring homebrew cask options..."
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi
