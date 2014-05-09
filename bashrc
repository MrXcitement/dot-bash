# bashrc -- Personal aliases and functions
# To install symlink to ~/.bashrc

# Mike Mike <mike@thebarkers.com>
# April 13th, 2013

# If not running interactively, just exit
if [ -z "$PS1" ]; then
    return
fi

# If the system bashrc file exist, load it.
if [ -f "/etc/bashrc" ]; then
    source /etc/bashrc
fi

# limit system-wide resourse usage
ulimit -S -c 0	    # no coredumps

# Manipulate shell variables
set -o notify	   # report status of terminated background jobs immediately
set -o noclobber   # prevent redirection from overwriting files
set -o ignoreeof   # do not exit on eof

# Load the bash prompt
if [ -f "$HOME/.bash_prompt" ]; then
    source "$HOME/.bash_prompt"
fi

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
alias ec='emacsclient'
alias en='emacs -nw'
alias enc='emacsclient -nw'

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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# python and virtualenv setup
if [[ -x /usr/local/bin/virtualenv ]]; then
    if [[ -x /usr/local/bin/virtualenvwrapper.sh ]]; then
	. /usr/local/bin/virtualenvwrapper.sh
    fi
fi
