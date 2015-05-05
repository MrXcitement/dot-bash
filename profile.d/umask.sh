# umask.sh -- configure a default umask value

# Copyright (C) 2014 Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# By default we want the umask to get set.
if [ "$(id -gn)" = "$(id -un)" -a $EUID -gt 99 ] ; then
  umask 002
else
  umask 022
fi
