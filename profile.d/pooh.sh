# pooh.sh --- configure the host pooh only
# Put any configuration that should be done on pooh in this script.

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 30, 2014

# History:
# 2014.10.30
# * First release.

if [[ `hostname -s` = pooh ]]; then
    export VAGRANT_HOME=/Volumes/MyPassport01/vagrant/vagrant.d
fi
