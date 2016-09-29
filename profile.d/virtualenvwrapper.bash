# virtualenv setup
if [[ $(type -P virtualenv) ]]; then
    if [[ $(type -P virtualenvwrapper.sh) ]]; then
        export WORKON_HOME=${HOME}/.virtualenvs
        export PROJECT_HOME=${HOME}/src
        . virtualenvwrapper.sh
    fi
fi
