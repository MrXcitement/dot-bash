# dircolors.sh -- colorize the directory listing ls command.
# This script handles both BSD (Mac OS) and GNU/Linux ls commands.

# Mike Barker <mike@thebarkers.com>
# April 13th, 2013

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
