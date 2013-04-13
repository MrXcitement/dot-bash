# readline.sh -- setup default inputrc config

# Mike Mike <mike@thebarkers.com>
# April 13th, 2013

# Setup the INPUTRC environment variable.
if [ -z "$INPUTRC" -a ! -f "$HOME/.inputrc" ] ; then
        INPUTRC=/etc/inputrc
fi
export INPUTRC
