# bash_profile -- Personal environment variables and startup programs.

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# Sourced by bash
# Source ~/.profile.d/*.bash files
# Source ~/.profile file

[ $DEBUG ] && echo "Loading .bash_profile"

# Load the bash scripts in the personal profile directory
for script in $HOME/.profile.d/*.bash; do
    if [ -r $script ]; then
	[ $DEBUG ] && echo "Loading $script"
	. $script
    fi
done

# Source the personal .profile file
if [ -f "$HOME/.profile" ]; then
    . $HOME/.profile
fi
