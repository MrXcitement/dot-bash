#!/bin/bash
# bash_profile -- Personal environment variables and startup programs.

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# History
# 2015-06-11 MRB
# * Changed order of sourcing files so that .profile and .profile.d/*.sh get
# sourced first This was done in order to make sure that library functions get
# loaded before everthing else.
# 2019-03-11 MRB
# * I have moved the sourcing of files in .profile.d first, followed by
# sourcing the .bashrc file.
# * Source the system profile if it exists.

# Sourced by bash
# 
# Source /etc/profile
# Source ~/.profile.d/*.sh and *.bash files
# Source ~/.bashrc file

# shellcheck disable=SC2128
[ "$DEBUG" ] && echo "[${BASH_SOURCE}]" >&2

# Load the system /etc/profile
if [ -r /etc/profile ]; then
	[ "$DEBUG" ] && echo "Loading /etc/profile" >&2
    # shellcheck source=/dev/null
    . "/etc/profile"
fi

# Load the sh and bash scripts in the personal profile directory
for script in "${HOME}"/.profile.d/*sh; do
	[ "$DEBUG" ] && echo "Loading ${script}"
    # shellcheck source=/dev/null
	. "${script}"
done

# load the personal bashrc file
if [ -r "${HOME}/.bashrc" ]; then
    [ "$DEBUG" ] && echo "Loading ${HOME}/.bashrc" >&2
    # shellcheck source=/dev/null
    . "${HOME}/.bashrc"
fi

