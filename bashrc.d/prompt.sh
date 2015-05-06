# set prompt: ``username@hostname$ ''
if [ -z $BASH ]; then
    PS1='`whoami`@`hostname`:$PWD
$ '
fi
