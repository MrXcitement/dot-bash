# set prompt: ``username@hostname$ ''

CUR_SHELL="$0"
NEW_PROMPT='[`whoami`@`hostname`] at $PWD 
$ '

case "$CUR_SHELL" in
	*bash*) ;; 
	*sh*) PS1=$NEW_PROMPT ;;
	*) echo "unknown shell..." ;;
esac
