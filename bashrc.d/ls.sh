# ls.sh -- ls customization
# colorize the ls command and assign some aliases

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# This script handles both BSD (Mac OS) and GNU/Linux ls commands.
if ls --color -d . >/dev/null 2>&1; then
    [ $DEBUG ] && echo "...GNU style ls supports --color"
    if [ -f "$HOME/.dircolors" ] ; then
	eval $(dircolors -b $HOME/.dircolors)
    fi
    alias ls='ls --color=auto'

elif ls -G -d . >/dev/null 2>&1; then
    [ $DEBUG ] && echo "...BSD style ls supports -G"
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
    alias ls='ls -G'
fi

# ls aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'