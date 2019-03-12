# path.bash -- Library of path helper functions for bash

# Copyright (C) 2013-2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: April 13th 2013

# Functions to help us manage paths.  Second argument is the name of the
# path variable to be modified (default: PATH)

# Remove a path segment from the PATH
pathremove () {
	local IFS=':'
	local NEWPATH
	local DIR
	local PATHVARIABLE=${2:-PATH}
	for DIR in ${!PATHVARIABLE} ; do
		if [ "$DIR" != "$1" ] ; then
		  NEWPATH=${NEWPATH:+$NEWPATH:}$DIR
		fi
	done
	export $PATHVARIABLE="$NEWPATH"
}

# Prepend a new path segment to the path, making sure there are no duplicates
pathprepend () {
	pathremove $1 $2
	local PATHVARIABLE=${2:-PATH}
	export $PATHVARIABLE="$1${!PATHVARIABLE:+:${!PATHVARIABLE}}"
}

# Append a new segment to the path, making sure there are no duplicates
pathappend () {
	pathremove $1 $2
	local PATHVARIABLE=${2:-PATH}
	export $PATHVARIABLE="${!PATHVARIABLE:+${!PATHVARIABLE}:}$1"
}

# Pretty print PATH by printing each segment on it's own line.
ppath () {
	echo $PATH | tr -s ':' '\n'
}
