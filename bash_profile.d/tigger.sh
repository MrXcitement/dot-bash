# tigger.sh --- configure the host tigger only
# Put any configuration that should be done on tigger in this script.

# Copyright (C) 2014 by Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 30, 2014

# History:
# 2014.10.30
# * First release.

if [[ `hostname -s` = tigger ]]; then
    export VAGRANT_HOME=/Volumes/MyPassport01/vagrant
fi
