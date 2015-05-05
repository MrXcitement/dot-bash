# dircolors.sh -- colorize the directory listing ls command.

# Copyright (C) 2013-2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# This script handles both BSD (Mac OS) and GNU/Linux ls commands.
if ls --color -d . >/dev/null 2>&1; then
    if [ -f "$HOME/.dircolors" ] ; then
	eval $(dircolors -b $HOME/.dircolors)
    fi
    alias ls='ls --color=auto'
elif ls -G -d . >/dev/null 2>&1; then
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -G'
fi
