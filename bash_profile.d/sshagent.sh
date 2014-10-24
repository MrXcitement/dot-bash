# sshagent.ssh --- initialize the ssh-agent process to store private keys

# Copyright (C) 2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# initialize the ssh-agent script so that we can auto-login to ssh servers
# on gnome systems that have the gnome-keyring-daemon installed, use it
# otherwise use the ssh-agent command.

if command gnome-keyring-daemon 2</dev/null; then
    eval `gnome-keyring-daemon -s`
else
    eval `ssh-agent`
fi
