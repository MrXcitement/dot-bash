# profile -- Personal environment variables and startup programs.
# This file is loaded by sh at startup or by .bash_profile
# Symlink this file to ~/.profile.

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 4th, 2015
# Copyright (C) 2015 Mike Barker

echo $HOME/.profile

# If the personal bashrc file exist, source it
if [ -f $HOME/.bashrc ]; then
    source $HOME/.shrc
fi

# Load the bash scripts in personal profile directory
for script in $HOME/.profile.d/*.sh; do
    if [ -r $script ]; then
		source $script
    fi
done
