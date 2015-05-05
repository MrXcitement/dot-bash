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
