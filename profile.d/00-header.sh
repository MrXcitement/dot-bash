# Display the bash version and DISPLAY setting
if [ -n "$BASH" ]; then
    # Display the bash version and DISPLAY setting
    printf "${BBlue}This is BASH ${BRed}${BASH_VERSION%.*}${NC}\n"
    if [ -n "$DISPLAY" ]; then
        printf "${BBlue}DISPLAY on ${BRed}$DISPLAY${NC}\n"
    fi

else
    echo "This is the $0 shell."
    if [ -n "$DISPLAY" ]; then
        echo "DISPLAY on $DISPLAY"
    fi
fi

# Display the date
echo "$(date)"
