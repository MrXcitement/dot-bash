#!/bin/bash
# pyenv.bash --- initalize the pyenv python management system
# Mike Barker <mike@thebarkers.com>
# September 29th 2016

# Check if pyenv is installed, then initialize it
if [[ $(command -v "pyenv") ]]; then
    export PYENV_ROOT="${HOME}/.pyenv"
    pathprepend "${PYENV_ROOT}/bin"
    eval "$(pyenv init -)"

    # Initialize pyenv's virtualenv plugin, if installed
    if [[ $(command -v pyenv-virtualenv-init ) ]]; then
        eval "$(pyenv virtualenv-init -)"
    fi

    # Initalize pyenv's virtualenvwrapper tool only if pyenv-virtualenvwrapper is installed
    if [[ $(command -v pyenv-sh-virtualenvwrapper ) ]]; then
        export WORKON_HOME=${HOME}/.virtualenvs
        export PROJECT_HOME=${HOME}/src
        pyenv virtualenvwrapper
    fi
fi

