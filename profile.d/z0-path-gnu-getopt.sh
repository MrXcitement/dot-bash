#!/bin/sh
GNU_GETOPT_BIN=/usr/local/opt/gnu-getopt/bin
if [ -d "${GNU_GETOPT_BIN}" ]; then
    pathprepend "${GNU_GETOPT_BIN}"
fi
