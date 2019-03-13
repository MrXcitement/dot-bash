#!/bin/bash
# readline.sh -- setup default inputrc config

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th, 2013

# Copyright (C) 2013-2014 Mike Barker

# Setup the INPUTRC environment variable.
if [ -z "$INPUTRC" ] && [ ! -f "${HOME}/.inputrc" ] ; then
    INPUTRC=/etc/inputrc
fi
export INPUTRC
