#!/bin/sh
# z0-path-mysql.sh --- Prepend the mysql path to the user's path
# Mike Barker <mike@thebarkers.com>
# March 25th, 2019

# mysql path is system dependant
SYSTEM=$(uname)
if [ "${SYSTEM}" = "Darwin" ]; then
    MYSQL_PATH="/usr/local/opt/mysql-client/bin"
fi

if [ "${MYSQL_PATH}" ] && [ -d "${MYSQL_PATH}" ]; then
    pathprepend "${MYSQL_PATH}"
fi
