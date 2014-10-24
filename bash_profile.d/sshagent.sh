# sshagent.ssh --- initialize the ssh-agent process to store private keys

# Copyright (C) 2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# Initialize the ssh-agent script so that we can auto-login to ssh servers.
# On gnome systems that have the gnome-keyring-daemon installed and are 
# running X, setup the gnome-keyring-daemon to provide keymanagement.
# To keep the shell from hanging when exiting, I export the GNOME_KEYRING_PID
# and then in .bash_logout, I check for this environment variable and kill the
# gnome-keyring-daemon and dbus-launch processes that have been spawned.

eval `ssh-agent -s`
if type gnome-keyring-daemon >/dev/null 2>&1 && [ -n "$DISPLAY" ]; then
	eval `gnome-keyring-daemon -s`
	export GNOME_KEYRING_PID
fi
