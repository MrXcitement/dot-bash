# profile -- Personal environment variables and startup programs.

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 4th, 2015

# Sourced by either sh or ~/.bash_profile
# Source ~/.profile.d/*.sh files
# Source ~/.shrc file

[ $DEBUG ] && echo "Loading $HOME/.profile"

# Load the bash scripts in personal profile directory
for script in $HOME/.profile.d/*.sh; do
    if [ -r $script ]; then
        [ $DEBUG ] && echo "Loading ${script}"
	. $script
    fi
done

# If the personal bashrc file exist, source it
if [ -f $HOME/.shrc ]; then
   . $HOME/.shrc
fi
