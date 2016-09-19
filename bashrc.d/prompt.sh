# set prompt: ``username@hostname$ ''

CUR_SHELL=`ps -o command= -p $$` 
NEW_PROMPT='[`whoami`@`hostname`] at $PWD 
$ '

case "$CUR_SHELL" in
	*bash*) ;; 
	*sh*) PS1=$NEW_PROMPT ;;
	*) echo "unknown shell..." ;;
esac

#
