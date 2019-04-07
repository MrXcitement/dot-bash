#!/bin/bash
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
# USER:
#    Bold Blue == normal user
#    Orange    == SU to user
#    Red       == root
# HOST:
#    Bold Blue == local session
#    Bold Cyan == secured remote connection (via ssh)
#    Red       == unsecured remote connection
# PWD:
#    Green     == more than 10% free disk space
#    Orange    == less than 10% free disk space
#    ALERT     == less than 5% free disk space
#    Red       == current user does not have write privileges
#    Cyan      == current filesystem is size zero (like /proc)
# HISTORY:
#    Green     == machine load is low
#    Orange    == machine load is medium
#    Red       == machine load is high
#    ALERT     == machine load is very high
# JOBS:
#    White     == no background or suspended jobs in this shell
#    Cyan      == at least one background job in this shell
#    Orange    == at least one suspended job in this shell
#
#    Command is added to the history file each time you hit enter,
#    so it's available to all shells (using 'history -a').

ALERT=${CLR_BOLD_WHITE}${CLR_BACK_RED} # Bold White on red background

# Get the system name
SYSTEM=$(uname -s)

# User color based on user type
__prompt_user_color() {
    local user_name color
    user_name=$(logname > /dev/null 2>&1)
    # shellcheck disable=SC2181
    if [[ $? -ne 0 ]]; then
       user_name=$USER
    fi
    # Determine color for user
    if [[ ${USER} = "root" ]]; then
        color="${CLR_RED}"
    elif [[ ! "${USER}" = "$user_name" ]]; then
        color="${CLR_BOLD_RED}"
    else
        color="${CLR_BOLD_BLUE}"
    fi
    printf "\001%s\002" "$color"
}

# Connection color based on connection type
__prompt_connection_color() {
    if [[ -n "${SSH_CONNECTION}" ]]; then
        connection_color=${CLR_BOLD_CYAN}
    elif [[ (${DISPLAY} == *:0) && \
            (${DISPLAY} != *xquartz:0) && \
            (${DISPLAY} != *org.x:0) && \
            (${DISPLAY} != :0) ]]; then
        connection_color=${ALERT}
    else
        connection_color=${CLR_BOLD_BLUE}
    fi
    printf "\001%s\002" "$connection_color"
}

# System load as percentage, i.e., '40' rather than '0.40)'.
__prompt_load() {
    local SYSLOAD
    if [[ ${SYSTEM} == "Linux" ]]; then
        SYSLOAD=$(cut -d " " -f1 /proc/loadavg | tr -d '.')
    elif [[ ${SYSTEM} == "Darwin" ]]; then
        SYSLOAD=$(sysctl -n vm.loadavg | cut -d " " -f2)
    else
        SYSLOAD=01
    fi
    # System load of the current host.
    printf "%s" "$(echo $SYSLOAD | awk '{printf("%d",$1 * 10)}')"
}

# System load color based on load.
__prompt_load_color() {
    local SYSLOAD
    SYSLOAD=$(__prompt_load)
    if [[ ${SYSTEM} == "Linux" ]]; then
        NCPU=$(grep -c 'processor' /proc/cpuinfo)
        SLOAD=$(( 200*NCPU ))
        MLOAD=$(( 400*NCPU ))
        XLOAD=$(( 600*NCPU ))
    elif [[ ${SYSTEM} == "Darwin" ]]; then
        NCPU=$(sysctl -n machdep.cpu.core_count)
        SLOAD=$(( 25*NCPU ))
        MLOAD=$(( 50*NCPU ))
        XLOAD=$(( 80*NCPU ))
    else
        NCPU=1
        SLOAD=$(( 200*NCPU ))
        MLOAD=$(( 400*NCPU ))
        XLOAD=$(( 600*NCPU ))
    fi
    if [[ ${SYSLOAD} -gt ${XLOAD} ]]; then
        color="${ALERT}"
    elif [[ ${SYSLOAD} -gt ${MLOAD} ]]; then
        color="${CLR_RED}"
    elif [[ ${SYSLOAD} -gt ${SLOAD} ]]; then
        color="${CLR_BOLD_RED}"
    else
        color="${CLR_GREEN}"
    fi
    printf "\001%s\002" "$color"
}

# Disk color based on free disk space in $PWD.
__prompt_disk_color() {
    # No 'write' privilege in the current directory.
    if [[ ! -w "${PWD}" ]]; then
        color="${CLR_RED}"

    # Check free space and set color accordingly
    elif [[ -s "${PWD}" ]]; then
        local used
        used=$(df -P "$PWD" | awk 'END {print $5}' | awk '{sub(/%/,""); print}')
        if [[ ${used} -gt 95 ]]; then
            color="${ALERT}"
        elif [[ ${used} -gt 90 ]]; then
            color="${CLR_BOLD_RED}"
        else
            color="${CLR_GREEN}"
        fi
    # Current directory is size '0' (like /proc, /sys etc).
    else
        color="${CLR_CYAN}"
    fi
    printf "\001%s\002" "$color"
}

# Job color based on running/suspended jobs.
__prompt_job_color() {
    if [[ $(jobs -s | wc -l) -gt "0" ]]; then
        color="${CLR_BOLD_RED}"
    elif [[ $(jobs -r | wc -l) -gt "0" ]] ; then
        color="${CLR_BOLD_CYAN}"
    fi
    printf "%s" "$color"
}

# Git status information
__prompt_git_info() {
    if [[ $(type -t __git_ps1) ]]; then
        __git_ps1 " at (%s)" 
    else
        printf ""
    fi
}

##
# Add git status if available
# Source the git-prompt.sh support file
if [[ ! $(type -t __git_ps1) ]]; then
    GIT_PROMPT=""
    if [[ ${SYSTEM} == "Linux" ]]; then
        GIT_PROMPT=/etc/bash_completion.d/git-prompt
    elif [[ ${SYSTEM} == "Darwin" ]]; then
        GIT_PROMPT=/usr/local/etc/bash_completion.d/git-prompt.sh
    fi
    # shellcheck source=/dev/null
    [[ -f ${GIT_PROMPT} ]] && source ${GIT_PROMPT}
fi

# Only set git prompt variables if it is installed.
if [[ $(type -t __git_ps1) ]]; then

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
fi

# Run this everytime we show the prompt
PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

# Construct the prompt.
case ${TERM} in
    *term* | rxvt | linux | screen* )
        PS1=
        PS1="${PS1}\$(__prompt_user_color)\u\[$CLR_RESET\]"
        PS1="${PS1}@"
        PS1="${PS1}\$(__prompt_connection_color)\h\[$CLR_RESET\]"
        PS1="${PS1} in "
        PS1="${PS1}\$(__prompt_disk_color)\W\[$CLR_RESET\]"
        PS1="${PS1}\$(__prompt_git_info)"
        PS1="${PS1}\n"
        PS1="${PS1}[\$(__prompt_load_color)\!\[$CLR_RESET\]] "
        PS1="${PS1}\$(__prompt_job_color)\$\[$CLR_RESET\] "

        # Set title of current xterm:
        # case $TERM in
        #     xterm*)
        #         PS1=${PS1}"\[\e]0;[\u@\h] \w\$(git_branch)\a\]"
        #         ;;
        # esac
        ;;
    *)
        # --> Shows full pathname of current dir.
        PS1="[\A \u@\h \w \$(git_branch)]\n\$ "
        ;;
esac
