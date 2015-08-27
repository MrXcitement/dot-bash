# vmware.bash --- Aliases and settings for a system with vmware fusion or workstation installed
# Create alias to vmware command line tools

# Author: Mike Barker <mike@thebarkers.com>
# Created: August 27, 2015

# History:
# 2015.08.27
# * First release.

# Only set alias if VMware Fusion is installed
if [ -d "/Applications/VMware Fusion.app/" ]; then
    alias vmrun="/Applications/VMware\ Fusion.app/Contents/Library/vmrun"
fi
