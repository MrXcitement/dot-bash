# python.bash --- Configure python environment
# Add local python package bin dir to path

# Author: Mike Barker <mike@thebarkers.com>
# Created: June 11, 2015

# History:
# 2015.06.11
# * First release.

SYSTEM=$(uname -s)
if [ $SYSTEM == "Darwin" ]; then
    PYTHON_USER_BIN=~/Library/Python/2.7/bin
fi

if [[ $PYTHON_USER_BIN && -d $PYTHON_USER_BIN ]]; then
    [ $DEBUG ] && echo "...Prepend $PYTHON_USER_BIN to path"
    pathprepend $PYTHON_USER_BIN
fi
