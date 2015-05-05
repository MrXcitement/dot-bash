# bashrc -- Personal aliases and functions used by bash

# Mike Mike <mike@thebarkers.com>
# April 13th, 2013

# Sourced by ~/.shrc if current shell is bash
# Source /etc/bashrc
# Source ~/.bashrc.d/*.bash files

[ $DEBUG ] && echo "Loading .bashrc"

# If not running interactively, just exit
if [ -z "$PS1" ]; then
    return
fi

# If the system bashrc file exist, load it.
if [ -f "/etc/bashrc" ]; then
    [ $DEBUG ] && echo "Loading /etc/bashrc"
    . /etc/bashrc
fi

# Load the bash scripts in personal bashrc.d directory
for script in $HOME/.bashrc.d/*.bash; do
    if [ -r $script ]; then
	[ $DEBUG ] && echo "Loading $script"
	. $script
    fi
done

# limit system-wide resourse usage
ulimit -S -c 0	    # no coredumps

# Manipulate shell variables
set -o notify	   # report status of terminated background jobs immediately
set -o noclobber   # prevent redirection from overwriting files
set -o ignoreeof   # do not exit on eof

# Display bash version and date
printf "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
 - DISPLAY on ${BRed}$DISPLAY${NC}\n"

echo $(date)

# Makes our day a bit more fun....
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s
fi

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'

export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo ${BCyan})[%d/%m %H:%M:%S]$(echo ${NC}) "
export HISTCONTROL=ignoredups

export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts

# spelling setup -- on osx, use brew install hunspell
export DICTIONARY=en_US

# Command aliases for emacs
alias e='emacs'
alias en='emacs -nw'
alias ec='emacsclient'
alias ecn='emacsclient -nw'

# ls aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# Get the system name
System=$(uname -s)
Bash_completion_file=""

# Set the sytem specific bash completion file
if [[ "${System}" == "Darwin" ]]; then
    Bash_completion_file=$(brew --prefix)/etc/bash_completion
elif [[ "${System}" == "Linux" ]]; then
    Bash_completion_file=/etc/bash_completion
fi

# If the bash completion file is available, initialize it.
if [[ -f ${Bash_completion_file} ]]; then
    . ${Bash_completion_file}
fi

# rvm setup
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
if [ -s "$HOME/.rvm/scripts/rvm" ]; then
    . "$HOME/.rvm/scripts/rvm"
fi

# python and virtualenv setup
if [[ -x /usr/local/bin/virtualenv ]]; then
    if [[ -x /usr/local/bin/virtualenvwrapper.sh ]]; then
	. /usr/local/bin/virtualenvwrapper.sh
    fi
fi
