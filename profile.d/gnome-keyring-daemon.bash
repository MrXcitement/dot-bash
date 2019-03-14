#!/bin/bash
# gnome-keyring-daemon.bash --- Load the gnome-keyring-daemon

# On gnome systems that have the gnome-keyring-daemon installed and are
# running X, setup the gnome-keyring-daemon to provide keymanagement.
# To keep the shell from hanging when exiting, I export the GNOME_KEYRING_PID
# and then in .bash_logout, I check for this environment variable and kill the
# gnome-keyring-daemon and dbus-launch processes that have been spawned.

# Author: Mike Barker <mike@thebarkers.com>
# Created: February 10, 2015

# History:
# 2015.02.10
# * First release.

# Gnome keyring setup
if type gnome-keyring-daemon >/dev/null 2>&1 && [ -n "$DISPLAY" ]; then
    eval "$(gnome-keyring-daemon -s)"
    export GNOME_KEYRING_PID
fi
