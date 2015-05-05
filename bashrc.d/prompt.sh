# set prompt: ``username@hostname$ ''
if [ -z $BASH ]; then
    PS1='`username`@`hostname`:$PWD
$ '
fi
