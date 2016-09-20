# profile -- Personal environment variables and startup programs.

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 4th, 2015

# Sourced by either sh or ~/.bash_profile
# Source ~/.shrc file
# Source ~/.profile.d/*.sh files

[ $DEBUG ] && echo "Loading $HOME/.profile"

# If the personal bashrc file exist, source it
if [ -f $HOME/.shrc ]; then
   . $HOME/.shrc
fi

# Load the bash scripts in personal profile directory
for script in $HOME/.profile.d/*.sh; do
    if [ -r $script ]; then
        [ $DEBUG ] && echo "Loading ${script}"
	. $script
    fi
done

#_byobu_sourced=1 . /usr/local/Cellar/byobu/5.108/bin/byobu-launch 2>/dev/null || true
