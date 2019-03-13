#!/bin/sh
# Display the bash version and DISPLAY setting
if [ -n "$BASH" ]; then
    # shellcheck shell=bash disable=SC2154
    # Display the bash version and DISPLAY setting
    printf "%sThis is BASH %s\n" "${BBlue}" "${BRed}${BASH_VERSION%.*}${NC}"
    if [ -n "$DISPLAY" ]; then
        printf "%sDISPLAY on %s\n" "${BBlue}" "${BRed}$DISPLAY${NC}"
    fi

else
    echo "This is the $0 shell."
    if [ -n "$DISPLAY" ]; then
        echo "DISPLAY on $DISPLAY"
    fi
fi

# Display the date
date
