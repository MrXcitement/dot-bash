# sshagent.ssh --- initialize the ssh-agent process to store private keys

# Copyright (C) 2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# Initialize the ssh-agent script so that we can auto-login to ssh servers.

# 2015.02.10 MRB
# * Bug: the ssh-agent was loaded at every login, this caused it to be left in mem.
# * Gnome keyring setup moved to it's own file gnome-keyring-daemon.sh

# 2015.09.29 MRB
# * No longer try to add keys by default. Once you are logged into your
#   account you can run ssh-add to add any keys you wish to have loaded.

# Note: ~/.ssh/environment should not be used, as it
#       already has a different purpose in SSH.
SSH_ENV="$HOME/.ssh/agent.env"

function agent_is_running() {
	if [ "$SSH_AUTH_SOCK" ]; then
		true
	else
		false
	fi
}

function agent_load_env() {
	if [ -f "$SSH_ENV" ]; then
		source "$SSH_ENV" > /dev/null
	fi
}

function agent_start() {
	if [ ! -d "$HOME/.ssh" ]; then
		mkdir "$HOME/.ssh"
	fi
	(umask 077; ssh-agent > "$SSH_ENV")
}

function sshagent_main() {
	echo 'Loading ssh-agent...'
	if ! agent_is_running; then
		agent_load_env
	fi

	if ! agent_is_running; then
		agent_start
		agent_load_env
	fi
}

function keychain_main() {
	echo 'Loading keychain...'
	keychain $HOME/.ssh/id_rsa
	source $HOME/.keychain/$HOSTNAME-sh
}

if [ -x "$(command -v keychain)" ]; then
	keychain_main
else
	sshagent_main
fi

unset SSH_ENV
