#!/bin/sh
# path-snap.sh --- Append the snap bin folder to the path
#
# Mike Barker <mike@thebarkers.com>
# November 4th, 2018

SNAP_PATH="/snap/bin"
if [ -d "${SNAP_PATH}" ]; then
    pathprepend "${SNAP_PATH}"
fi
