#!/bin/sh
# path-home-python.bash --- add user python directories to the path
# Mike Barker <mike@thebarkers.com>
# June 11th, 2018


if [ "$(uname)" = "Darwin" ]; then
    # shellcheck disable=SC2231
    for p in ${HOME}/Library/Python/*/bin
    do
        pathprepend "$p"
    done
fi
