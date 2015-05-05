# function to start vscode.app from the command line
# https://code.visualstudio.com/Docs/setup

VSCODE_APP="Visual Studio Code"

vscode () {
	if [[ $# = 0 ]]; then
		open -a "$VSCODE_APP"
	else
		[[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
		open -a "$VSCODE_APP" --args "$F"
	fi
}
