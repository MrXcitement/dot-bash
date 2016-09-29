# virtualenvwrapper.bash --- initialize virtualenvwrapper
# Mike Barker <mike@thebarkers.com>
# September 29th 2016

# Initalize the virtualenvwrapper tool if pyenv is not installed
# If the pyenv tool is installed the virtualenvwrapper script will
# crash bash.
if [[ $(type -P virtualenvwrapper.sh) ]]; then
    if [[ ! $(type -P pyenv ) ]]; then
        export WORKON_HOME=${HOME}/.virtualenvs
        export PROJECT_HOME=${HOME}/src
        . virtualenvwrapper.sh
    fi
fi
