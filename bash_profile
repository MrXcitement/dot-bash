# bash_profile -- Personal environment variables and startup programs.

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# History
# 2015-06-11 MRB
# * Changed order of sourcing files so that .profile and .profile.d/*.sh get sourced first
#   This was done in order to make sure that library functions get loaded before everthing else.

# Sourced by bash
# Source ~/.bashrc file
# Source ~/.profile file
# Source ~/.profile.d/*.bash files

[ $DEBUG ] && echo "Loading $BASH_SOURCE"
eval $(/usr/libexec/path_helper -s)

# load the personal bashrc file
if [ -r $HOME/.bashrc ]; then
    . $HOME/.bashrc
fi

# Load the sh and bash scripts in the personal profile directory
for script in $HOME/.profile.d/*.{sh,bash}; do
    if [ -r $script ]; then
	[ $DEBUG ] && echo "Loading $script"
	. $script
    fi
done
