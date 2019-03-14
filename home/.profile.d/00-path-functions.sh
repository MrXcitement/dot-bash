#!/bin/sh
# path.bash -- Library of path helper functions for bash

# Copyright (C) 2013-2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th 2013

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)

# History:
# 2019-03-13 MRB
# Rewritten for portability, should now work under the bourne shell 'sh'
# See stack overflow for inspiration:
# https://stackoverflow.com/questions/370047/what-is-the-most-elegant-way-to-remove-a-path-from-the-path-variable-in-bash

# Remove a path segment from the PATH
pathremove () {
    PATH=$(printf "%s" "$PATH" | tr ":" "\n" | grep -v -x "$1" | tr "\n" ":" | sed 's/:$//' )
    export PATH
}

# Prepend a new path segment to the path, making sure there are no duplicates
pathprepend () {
    pathremove "$1"
    PATH="$1:$PATH"
    export PATH
}

# Append a new segment to the path, making sure there are no duplicates
pathappend () {
    pathremove "$1"
    PATH="$PATH:$1"
    export PATH
}

# Pretty print PATH by printing each segment on it's own line.
ppath () {
	printf "%s" "$PATH" | tr ":" "\n"
}
