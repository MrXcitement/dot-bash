# function to start vscode.app from the command line
# https://code.visualstudio.com/Docs/setup

# 2015.10.27 MRB
# The way you launch Visual Studio Code from the command line has changed.

vscode () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}
