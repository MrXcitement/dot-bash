#!/bin/bash
# fasd.bash --- Initialize the fasd command line navigator
# https://github.com/clvv/fasd

# Mike Barker <mike@thebarkers.com>
# March 5th, 2019

# History
# 2019-03-14 MRB
# Gaurd against the fasd program not installed.

if [[ "$(command -v fasd)" ]]; then
    eval "$(fasd --init auto)"
fi

