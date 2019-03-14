#!/bin/bash
# Get the system name
SYSTEM=$(uname -s)
BASH_COMPLETION_FILE=""

# Set the sytem specific bash completion file
if [[ "${SYSTEM}" == "Darwin" ]]; then
    BASH_COMPLETION_FILE=$(brew --prefix)/share/bash-completion/bash_completion
elif [[ "${SYSTEM}" == "Linux" ]]; then
    BASH_COMPLETION_FILE=/share/bash-completion/bash_completion
fi

# If the bash completion file is available, initialize it.
# shellcheck source=/dev/null
[[ -f ${BASH_COMPLETION_FILE} ]] && source ${BASH_COMPLETION_FILE}
