# prompt.bash -- Configure the bash prompt

# Shell Prompt - for many examples, see:
#       http://www.debian-administration.org/articles/205
#       http://www.askapache.com/linux/bash-power-prompt.html
#       http://tldp.org/HOWTO/Bash-Prompt-HOWTO
#       https://github.com/nojhan/liquidprompt
#-------------------------------------------------------------
# Current Format:
# USER@HOST in PWD <at (git status)>
# HISTORY:$ _
#
# HISTORY:
#    Green     == machine load is low
#    Orange    == machine load is medium
#    Red       == machine load is high
#    ALERT     == machine load is very high
# USER:
#    BBlue      == normal user
#    Orange    == SU to user
#    Red       == root
# HOST:
#    BBlue      == local session
#    BCyan      == secured remote connection (via ssh)
#    Red       == unsecured remote connection
# PWD:
#    Green     == more than 10% free disk space
#    Orange    == less than 10% free disk space
#    ALERT     == less than 5% free disk space
#    Red       == current user does not have write privileges
#    Cyan      == current filesystem is size zero (like /proc)
# $:
#    White     == no background or suspended jobs in this shell
#    Cyan      == at least one background job in this shell
#    Orange    == at least one suspended job in this shell
#
#    Command is added to the history file each time you hit enter,
#    so it's available to all shells (using 'history -a').

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

#-------------------------------------------------------------
# Get the system name
System=`uname -s`

# Test user type:
user_name=$(logname)
if [[ $? -ne 0 ]]; then
   user_name=$USER
fi
if [[ ${USER} = "root" ]]; then
    SU=${Red}           # User is root.
elif [[ ! "${USER}" = "$user_name" ]]; then
    SU=${BRed}          # User is not login user.
else
    SU=${BBlue}          # User is normal (well ... most of us are).
fi
unset user_name

# Test connection type:
if [[ -n "${SSH_CONNECTION}" ]]; then
    CNX=${BCyan}        # Connected on remote machine, via ssh (good).
elif [[ (${DISPLAY} == *:0) && \
        (${DISPLAY} != *xquartz:0) && \
        (${DISPLAY} != *org.x:0) && \
        (${DISPLAY} != :0) ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BBlue}        # Connected on local machine.
fi

# Get number of CPUs on system
if [[ ${System} == "Linux" ]]; then
    NCPU=$(grep -c 'processor' /proc/cpuinfo)    # Number of CPUs
    SLOAD=$(( 200*${NCPU} ))    # Small load
    MLOAD=$(( 400*${NCPU} ))    # Medium load
    XLOAD=$(( 600*${NCPU} ))    # Xlarge load

elif [[ ${System} == "Darwin" ]]; then
    NCPU=$(sysctl -n machdep.cpu.core_count)
    SLOAD=$(( 25 ))         # Small load
    MLOAD=$(( 50 ))         # Medium load
    XLOAD=$(( 80 ))         # Xlarge load

else
    NCPU=1
    SLOAD=$(( 200*${NCPU} ))    # Small load
    MLOAD=$(( 400*${NCPU} ))    # Medium load
    XLOAD=$(( 600*${NCPU} ))    # Xlarge load
fi

# Returns system load as percentage, i.e., '40' rather than '0.40)'.
load() {
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
load_color() {
    local SYSLOAD=$(load)
    if [[ ${SYSLOAD} -gt ${XLOAD} ]]; then
        printf ${ALERT}
    elif [[ ${SYSLOAD} -gt ${MLOAD} ]]; then
        printf ${Red}
    elif [[ ${SYSLOAD} -gt ${SLOAD} ]]; then
        printf ${BRed}
    else
        printf ${Green}
    fi
}

# Returns a color according to free disk space in $PWD.
disk_color() {
    # No 'write' privilege in the current directory.
    if [[ ! -w "${PWD}" ]]; then
        printf ${Red}
    # Check free space and set color accordingly
    elif [[ -s "${PWD}" ]]; then
        local used=$(command df -P "$PWD" |
                     awk 'END {print $5}' |
                     awk '{sub(/%/,""); print}')
        if [[ ${used} -gt 95 ]]; then
            printf ${ALERT}           # Disk almost full (>95%).
        elif [[ ${used} -gt 90 ]]; then
            printf ${BRed}            # Free disk space almost gone.
        else
            printf ${Green}           # Free disk space is ok.
        fi
    # Current directory is size '0' (like /proc, /sys etc).
    else
        printf ${Cyan}
    fi
}

# Returns a color according to running/suspended jobs.
job_color() {
    if [[ $(jobs -s | wc -l) -gt "0" ]]; then
        printf ${BRed}
    elif [[ $(jobs -r | wc -l) -gt "0" ]] ; then
        printf ${BCyan}
    fi
}

##
# Add git status if available

# Source the git-prompt.sh support file
if [[ ! $(declare -F __git_ps1) ]]; then
    GIT_PROMPT=""
    if [[ ${System} == "Linux" ]]; then
        GIT_PROMPT=/etc/bash_completion.d/git-prompt
    elif [[ ${System} == "Darwin" ]]; then
        GIT_PROMPT=/usr/local/etc/bash_completion.d/git-prompt.sh
    fi
    if [[ -f ${GIT_PROMPT} ]]; then
        source ${GIT_PROMPT}
    fi
fi

# non empty value to turn on
# * - unstaged, % - staged changes
export GIT_PS1_SHOWDIRTYSTATE=true

# non empty value to turn on
# $ - stashed item(s)
export GIT_PS1_SHOWSTASHSTATE=true

# non empty value to turn on
# % - untracked files
export GIT_PS1_SHOWUNTRACKEDFILES=true

# can be: "auto" or any of "versbose lagcy git svn"
# < - HEAD is behind upstream
# > - HEAD is ahead of upstream
# <> - HEAD has diverged from upstream
# = - HEAD is the same as upstream
export GIT_PS1_SHOWUPSTREAM="auto"

# show more info regarding commits of a detached HEAD
# can be: contains branch describe default
#export GIT_PS1_DESCRIBE_STYLE="default"

# non empty value will colorize the prompt
# this only works when using PROMPT_COMMAND
#export GIT_PS1_SHOWCOLORHINTS="true"

git_branch() {
    if [[ $(declare -F __git_ps1) ]]; then
        __git_ps1 " at (%s)" 
    else
        printf ""
    fi
}

# Run this everytime we show the prompt
PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

# Now we construct the prompt.
case ${TERM} in
    *term* | rxvt | linux | screen* )
        PS1=""

        # User@Host (with connection type info):
        PS1=${PS1}"\[${SU}\]\u\[${NC}\]@\[${CNX}\]\h\[${NC}\] in "

        # PWD (with 'disk space' info):
        PS1=${PS1}"\[\$(disk_color)\]\W\[${NC}\]"

        # Github branch:
        PS1=${PS1}"\$(git_branch)"

        # Newline
        PS1=${PS1}"\n"

        # History entry number (with load info):
        PS1=${PS1}"[\[\$(load_color)\]\!\[${NC}\]] "

        # Prompt (with 'job' info):
        PS1=${PS1}"\[\$(job_color)\]\$\[${NC}\] "

        # Set title of current xterm:
        case $TERM in
            xterm*)
                PS1=${PS1}"\[\e]0;[\u@\h] \w\$(git_branch)\a\]"
                ;;
        esac
        ;;
    *)
        # --> Shows full pathname of current dir.
        PS1="[\A \u@\h \w \$(git_branch)]\n\$ "
        ;;
esac
