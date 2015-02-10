# sshagent.ssh --- initialize the ssh-agent process to store private keys

# Copyright (C) 2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# Initialize the ssh-agent script so that we can auto-login to ssh servers.

# 2015.02.10 MRB
# * Bug: the ssh-agent was loaded at every login, this caused it to be left in mem.
# * Gnome keyring setup moved to it's own file gnome-keyring-daemon.sh

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
