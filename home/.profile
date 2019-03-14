# profile -- Personal environment variables and startup programs.

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 4th, 2015

# History
# 2019-03-11 MRB
# * I have moved the sourcing of files in .profile.d first, followed by
# sourcing the .shrc file.
# * Source system profile

# Sourced by sh
#
# Source /etc/profile
# Source ~/.profile.d/*.sh files
# Source ~/.shrc file

[ ${DEBUG} ] && echo "[${HOME}/.profile]" >&2

# Load the system /etc/profile
if [ -r /etc/profile ]; then
    [ ${DEBUG} ] && echo "Loading /etc/profile" >&2
    . /etc/profile
fi

# Load the bash scripts in personal profile directory
for script in $HOME/.profile.d/*.sh; do
    [ ${DEBUG} ] && echo "Loading ${script}" >&2
    . ${script}
done

# If the personal .shrc file exist, source it
if [ -f $HOME/.shrc ]; then
    [ ${DEBUG} ] && echo "Loading ${HOME}/.shrc" >&2
   . ${HOME}/.shrc
fi

