#!/bin/bash
# swiftenv.bash --- configure swiftenv environment
if which swiftenv > /dev/null; then
    export SWIFTENV_ROOT="$HOME/.swiftenv"
    eval "$(swiftenv init -)";
fi
