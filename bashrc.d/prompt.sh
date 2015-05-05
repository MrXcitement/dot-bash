# set prompt: ``username@hostname$ ''
#PS1="`whoami`@`hostname`"
#case `id -u` in
#0) PS1='${PS1} $PWD # ';;
#*) PS1='${PS1} $PWD $ ';;
#esac
PS1='$USER@`hostname`:$PWD 
$ '

