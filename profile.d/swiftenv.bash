#!/bin/bash
# swiftenv.bash --- configure swiftenv environment
if command -v swiftenv > /dev/null; then
    export SWIFTENV_ROOT="$HOME/.swiftenv"
    eval "$(swiftenv init -)";
fi
