# z2-iterm2_integration --- Install iterm2 integration if installed

# Mike Barker <mike@thebarkers.com>
# December 18th, 2016

if [ -d ${HOME}/.iterm2 ]; then
    source ~/.iterm2/iterm2_shell_integration.bash
    alias imgcat=~/.iterm2/imgcat
    alias it2dl=~/.iterm2/it2dl
fi
