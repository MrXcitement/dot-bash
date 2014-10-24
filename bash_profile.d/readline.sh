# readline.sh -- setup default inputrc config

# Copyright (C) 2013-2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# Setup the INPUTRC environment variable.
if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ] ; then
        INPUTRC=/etc/inputrc
fi
export INPUTRC
