#!/bin/bash
# z2-iterm2_integration --- Install iterm2 integration if installed

# Mike Barker <mike@thebarkers.com>
# December 18th, 2016

if [[ ${ITERM_PROFILE} ]] && [[ -d ${HOME}/.iterm2 ]]; then
    # shellcheck source=/dev/null
    source "${HOME}/.iterm2/iterm2_shell_integration.bash"
    alias imgcat='${HOME}/.iterm2/imgcat'
    alias it2dl='${HOME}/.iterm2/it2dl'
fi
