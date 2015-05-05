# bash_profile -- Personal environment variables and startup programs.
# This file is loaded by bash at startup, interactive or not.
# Symlink this file to ~/.bash_profile.

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013
# Copyright (C) 2013-2015 Mike Barker

echo "Loading .bash_profile"

# Load the bash scripts in the personal profile directory
for script in $HOME/.profile.d/*.bash; do
    if [ -r $script ]; then
	source $script
    fi
done

# Source the personal .profile file
if [ -f "$HOME/.profile" ]; then
    source $HOME/.profile
fi
