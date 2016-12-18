# tmux-status --- show what the current tmux status

# Mike Barker <mike@thebarkers.com>
# September 30th 2016

if [ $(type -P tmux) ] && [ -z "${TMUX+x}" ]; then
    echo 'tmux status:'
    tmux ls
fi
