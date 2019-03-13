#!/bin/sh
# Prepend peronal bin dir to path
if [ -d "${HOME}/bin" ]; then
    pathprepend "${HOME}/bin"
fi
