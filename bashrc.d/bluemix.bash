#!/bin/bash
# bluemix.bash --- Configure the bluemix cli

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 26th, 2017

# History:
# 2017-10-26
# * First release.

# bx bash autocompletion
BLUEMIX=/usr/local/Bluemix/bx/bash_autocomplete
if [[ -r ${BLUEMIX} ]]; then
    # shellcheck disable=SC1090
    source "${BLUEMIX}"
fi
