# fasd.bash --- Initialize the fasd command line navigator
# https://github.com/clvv/fasd

# Mike Barker <mike@thebarkers.com>
# March 5th, 2019

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

# aliases
alias v='f -e vim' # quick opening files with vim

