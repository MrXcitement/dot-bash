#!/bin/sh
# Display the bash version and DISPLAY setting
if [ -n "$BASH" ]; then
    # shellcheck disable=SC2154
    
    # Display the bash version and DISPLAY setting
    printf "%sThis is BASH %s\n" "${CLR_BOLD_BLUE}" "${CLR_BOLD_RED}${BASH_VERSION%.*}${CLR_RESET}"
    if [ -n "$DISPLAY" ]; then
        printf "%sDISPLAY on %s\n" "${CLR_BOLD_BLUE}" "${CLR_BOLD_RED}$DISPLAY${CLR_RESET}"
    fi

else
    echo "This is the $0 shell."
    if [ -n "$DISPLAY" ]; then
        echo "DISPLAY on $DISPLAY"
    fi
fi

# Display the date
date
