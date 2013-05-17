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
alias en='emacs -nw'
alias ec='emacsclient'
alias ecn='emacsclient -nw'

# ls aliases
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

# rvm setup
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
