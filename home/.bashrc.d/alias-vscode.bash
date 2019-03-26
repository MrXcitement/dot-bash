#!/bin/bash
# function to start vscode.app from the command line
# https://code.visualstudio.com/Docs/setup

# 2015.10.27 MRB
# The way you launch Visual Studio Code from the command line has changed.
# 2019.03.11 MRB
# Recommended launch strategy is to add the binary to the path...
# I am just aliasing the binary instead.

# On Darwin/macOS systems that have Visual Studio Code installed
# Set an alias to the binary.
if [[ -d "/Applications/Visual Studio Code.app" ]]; then 
    alias code="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
fi
