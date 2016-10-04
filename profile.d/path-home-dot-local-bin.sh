# Add .local/bin to path
NEW_PATH="${HOME}/.local/bin"
if [ -d ${NEW_PATH} ]; then
    export PATH=${NEW_PATH}:${PATH}
fi
