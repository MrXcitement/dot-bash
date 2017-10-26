# bluemix.bash --- Configure the bluemix cli

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 26th, 2017

# History:
# 2017-10-26
# * First release.

# bx bash autocompletion
if [[ $(command -v bx) ]]; then
    source /usr/local/Bluemix/bx/bash_autocomplete
fi
