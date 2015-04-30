#!/usr/bin/env bash

# install-- make symbolic links in the users home directory
# Mike Barker <mike@thebarkers.com>
# May 14th, 2013

# 205.04.30 MRB
# renamed from makelinks.sh to install.sh

echo "$(basename $0)"
echo "Make sympolic links in the users home directory to the bash config files and directories"

DIR="$(cd "$(dirname "$0")" && pwd)"
for FILE in bash* inputrc; do 
    echo "Processing file ${FILE}"
    if [ -a ~/.${FILE} ]; then
	if ! [ -h ~/.${FILE} ]; then
	    mv ~/.${FILE} ~/.${FILE}.backup
	fi
    fi
    if ! [ -h ~/.${FILE} ]; then
	ln -sv ${DIR}/${FILE} ~/.${FILE}
    fi
done
