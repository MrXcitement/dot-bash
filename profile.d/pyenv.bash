# pyenv.bash --- initalize the pyenv python management system
# Mike Barker <mike@thebarkers.com>
# September 29th 2016

# Check if pyenv is installed, then initialize it
if [[ $(type -P "pyenv") ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT"/bin:$PATH
    eval "$(pyenv init -)"
fi
