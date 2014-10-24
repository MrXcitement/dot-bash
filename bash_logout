# bash_logout -- Personal items to perform at logout.

# Copyright (C) 2013-2014 Mike Barker

# Mike Mike <mike@thebarkers.com>
# April 13th, 2013

# Cleanup when logging out
if [ -n "$GNOME_KEYRING_PID" ]; then
	killall gnome-keyring-daemon
	killall -9 dbus-launch
fi
