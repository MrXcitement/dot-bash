#!/bin/sh
# path-macvim.sh --- Prepend the macvim bin folder to the path
#
# Mike Barker <mike@thebarkers.com>
# October 1, 2017

MACVIM_PATH="/Applications/MacVim.app/Contents/bin"
if [ -d "${MACVIM_PATH}" ]; then
    pathprepend "${MACVIM_PATH}"
fi
