#!/bin/bash
# function to start vscode.app from the command line
# https://code.visualstudio.com/Docs/setup

# 2015.10.27 MRB
# The way you launch Visual Studio Code from the command line has changed.
# 2019.03.11 MRB
# Recommended launch strategy is to add the binary to the path...
# I am just aliasing the binary instead.
# 2019.05.03 MRB
# - Changed alias for vscode from code to vsc
# - Added vscode insiders as vsci

# On Darwin/macOS systems that have Visual Studio Code installed
# Set an alias to the binary.
if [[ -d "/Applications/Visual Studio Code.app" ]]; then 
    alias vsc="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
fi

if [[ -d "/Applications/Visual Studio Code - Insiders.app" ]]; then
    alias vsci="/Applications/Visual\ Studio\ Code\ -\ Insiders.app/Contents/Resources/app/bin/code"
fi