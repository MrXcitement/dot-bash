# bash_profile -- Personal environment variables and startup programs.

# Copyright (C) 2013-2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# This file is loaded at bash startup by all shells, interactive or not.
# Symlink this file to ~/.bash_profile.

# Load the scripts in personal bash_profile directory
for script in $HOME/.bash_profile.d/*.sh; do
    if [ -r $script ]; then
	source $script
    fi
done

# Load personal bashrc file
if [ -f "$HOME/.bashrc" ]; then
    source $HOME/.bashrc
fi

# Add peronal bin dir to path
if [ -d "$HOME/bin" ]; then
    export PATH=$HOME/bin:$PATH
fi

# History configuration
export HISTSIZE=1000
export HISTIGNORE="&b:[bf]g:exit"
