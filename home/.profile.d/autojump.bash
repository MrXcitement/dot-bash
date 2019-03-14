#!/bin/bash
# autojump.sh --- configure autojump 
# A cd command that learns - easily navigate directories from the command line
# https://github.com/wting/autojump

# shellcheck disable=SC1090
AUTOJUMP=/usr/local/etc/profile.d/autojump.sh
[ -r "${AUTOJUMP}" ] && . "${AUTOJUMP}"
