# tmux-status --- show what the current tmux status

# Mike Barker <mike@thebarkers.com>
# September 30th 2016

if [[ $(type -P tmux -h) ]]; then
    echo 'tmux sessions currently active:'
    tmux ls
    echo ''
fi
