#!/bin/bash
# bash_logout -- Personal items to perform at logout.

# Mike Mike <mike@thebarkers.com>
# April 13th, 2013
# Copyright (C) 2013-2014 Mike Barker

# shellcheck disable=SC2128
[ "${DEBUG}" ] && echo "${BASH_SOURCE}" >&2

# Cleanup when logging out
if [ -n "$GNOME_KEYRING_PID" ]; then
    killall gnome-keyring-daemon
    killall -9 dbus-launch
fi

[ "${DEBUG}" ] && echo "Goodbye, from bash..." >&2
