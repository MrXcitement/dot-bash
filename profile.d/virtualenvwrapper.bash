# virtualenv setup
if [[ -x /usr/local/bin/virtualenv ]]; then
    if [[ -x /usr/local/bin/virtualenvwrapper.sh ]]; then
        export WORKON_HOME=${HOME}/.virtualenvs
        export PROJECT_HOME=${HOME}/src
        . /usr/local/bin/virtualenvwrapper.sh
    fi
fi
