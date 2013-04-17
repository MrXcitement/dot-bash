# bashrc -- Personal aliases and functions
# To install symlink to ~/.bashrc

# Mike Mike <mike@thebarkers.com>
# April 13th, 2013

# If not running interactively, just exit
if [ -z "$PS1" ]; then
    return
fi
 
# If the system bashrc file exist, load it.
if [ -f "/etc/bashrc" ]; then
    source /etc/bashrc
fi

# limit system-wide resourse usage
ulimit -S -c 0	    # no coredumps
ulimit -S -u 200    # max user processes

# Manipulate shell variables
set -o notify	   # report status of terminated background jobs immediately
set -o noclobber   # prevent redirection from overwriting files
set -o ignoreeof   # do not exit on eof

# Get the system name
System=`uname -s`

# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.

# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

ALERT=${BWhite}${On_Red} # Bold White on red background

# Display bash version and date
printf "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\
- DISPLAY on ${BRed}$DISPLAY${NC}\n"
date

# Makes our day a bit more fun....
if [ -x /usr/games/fortune ]; then
    /usr/games/fortune -s
fi

#-------------------------------------------------------------
# Shell Prompt - for many examples, see:
#       http://www.debian-administration.org/articles/205
#       http://www.askapache.com/linux/bash-power-prompt.html
#       http://tldp.org/HOWTO/Bash-Prompt-HOWTO
#       https://github.com/nojhan/liquidprompt
#-------------------------------------------------------------
# Current Format: [TIME USER@HOST PWD] >
# TIME:
#    Green     == machine load is low
#    Orange    == machine load is medium
#    Red       == machine load is high
#    ALERT     == machine load is very high
# USER:
#    Cyan      == normal user
#    Orange    == SU to user
#    Red       == root
# HOST:
#    Cyan      == local session
#    Green     == secured remote connection (via ssh)
#    Red       == unsecured remote connection
# PWD:
#    Green     == more than 10% free disk space
#    Orange    == less than 10% free disk space
#    ALERT     == less than 5% free disk space
#    Red       == current user does not have write privileges
#    Cyan      == current filesystem is size zero (like /proc)
# >:
#    White     == no background or suspended jobs in this shell
#    Cyan      == at least one background job in this shell
#    Orange    == at least one suspended job in this shell
#
#    Command is added to the history file each time you hit enter,
#    so it's available to all shells (using 'history -a').


# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi

# Test user type:
if [[ ${USER} == "root" ]]; then
    SU=${Red}           # User is root.
elif [[ ${USER} != $(logname) ]]; then
    SU=${BRed}          # User is not login user.
else
    SU=${BCyan}         # User is normal (well ... most of us are).
fi

# Get number of CPUs on system
if [[ ${System} == "Linux" ]]; then
    NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
    SLOAD=$(( 100*${NCPU} ))        # Small load
    MLOAD=$(( 200*${NCPU} ))        # Medium load
    XLOAD=$(( 400*${NCPU} ))        # Xlarge load
elif [[ ${System} == "Darwin" ]]; then
    NCPU=$(sysctl -n machdep.cpu.core_count)
    SLOAD=$(( 25 ))        # Small load
    MLOAD=$(( 50 ))        # Medium load
    XLOAD=$(( 80 ))        # Xlarge load
else
    NCPU=1
fi

# Returns system load as percentage, i.e., '40' rather than '0.40)'.
function load()
{
    if [[ ${System} == "Linux" ]]; then
	local SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
    elif [[ ${System} == "Darwin" ]]; then
    	local SYSLOAD=$(sysctl -n vm.loadavg | cut -d " " -f2)
    else
	local SYSLOAD=01
    fi
    # System load of the current host.
    echo $SYSLOAD | awk '{printf("%d",$1 * 10)}'       # Convert to decimal.
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        printf ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        printf ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        printf ${BRed}
    else
        printf ${Green}
    fi
}

# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        printf ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5}' | 
		   awk '{sub(/%/,""); print}')
        if [ ${used} -gt 95 ]; then
            printf ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            printf ${BRed}            # Free disk space almost gone.
        else
            printf ${Green}           # Free disk space is ok.
        fi
    else
        printf ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        printf ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        printf ${BCyan}
    fi
}

# Adds some text in the terminal frame (if applicable).

# Now we construct the prompt.
PROMPT_COMMAND="history -a"
case ${TERM} in
  *term* | rxvt | linux)
        #PS1="\[\$(load_color)\][\A\[${NC}\] "
        # Time of day (with load info):
        PS1="\[\$(load_color)\][\A\[${NC}\] "
        # User@Host (with connection type info):
        PS1=${PS1}"\[${SU}\]\u\[${NC}\]@\[${CNX}\]\h\[${NC}\] "
        # PWD (with 'disk space' info):
        PS1=${PS1}"\[\$(disk_color)\]\W]\[${NC}\] "
        # Prompt (with 'job' info):
        PS1=${PS1}"\[\$(job_color)\]>\[${NC}\] "
        # Set title of current xterm:
        PS1=${PS1}"\[\e]0;[\u@\h] \w\a\]"
        ;;
    *)
        PS1="(\A \u@\h \W) > " # --> PS1="(\A \u@\h \w) > "
                               # --> Shows full pathname of current dir.
        ;;
esac

export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'

export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(printf ${BCyan})[%d/%m %H:%M:%S]$(printf ${NC}) "
export HISTCONTROL=ignoredups

export HOSTFILE=$HOME/.hosts    # Put a list of remote hosts in ~/.hosts

# Command aliases for emacs
alias e='emacs'
alias en='emacs -nw'
alias ec='emacsclient'
alias ecn='emacsclient -nw'

# spelling setup -- on osx, use brew install hunspell
export DICTIONARY=en_US


