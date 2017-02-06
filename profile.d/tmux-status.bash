# tmux-status --- show what the current tmux status

# Mike Barker <mike@thebarkers.com>
# September 30th 2016

if [ $(type -P tmux) ] && [ -z "${TMUX+x}" ]; then
    data=$(tmux ls 2>/dev/null)
    if [ $? = 0 ]; then
        echo 'tmux sessions:'
        echo $data
    fi
fi
