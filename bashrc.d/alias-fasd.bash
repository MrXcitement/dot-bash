# alias-fasd.bash --- aliases for the 'fast' cli productivity booster
# https://github.com/clvv/fasd

# Mike Barker <mike@thebarkers.com>
# March 11th, 2019

alias v='f -e vim'      # quick opening files with vim
alias o='a -e open'     # 'open' files in associated app

FASD_BASH_HOOK=_fasd_bash_hook_cmd_complete
[ $(type -t ${FASD_BASH_HOOK}) ] && "${FASD_BASH_HOOK}" v o

