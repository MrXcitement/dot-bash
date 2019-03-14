#!/bin/sh
# Add .local/bin to path
NEW_PATH="${HOME}/.local/bin"
if [ -d "${NEW_PATH}" ]; then
    pathprepend "${NEW_PATH}"
fi
