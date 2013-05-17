# bash_profile -- Personal environment variables and startup programs.
# This file is loaded at bash startup by all shells, interactive or not.
# Symlink this file to ~/.bash_profile.

# Mike Barker <mike@thebarkers.com>
# April 13th, 2013

# Load the scripts in personal bash_profile directory
for script in $HOME/.bash_profile.d/*.sh; do
    if [ -r $script ]; then
	source $script
    fi
done

if [ -f "$HOME/.bashrc" ]; then
    source $HOME/.bashrc
fi

if [ -d "$HOME/bin" ]; then
    pathprepend $HOME/bin
fi

export HISTSIZE=1000
export HISTIGNORE="&b:[bf]g:exit"

eval `ssh-agent`
