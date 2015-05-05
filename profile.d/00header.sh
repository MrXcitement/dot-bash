# Display the bash version and DISPLAY setting
if [ $BASH ]; then
    # Display the bash version and DISPLAY setting
    printf "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\n"
    printf "DISPLAY on ${BRed}$DISPLAY${NC}\n"
else
    echo $(sh --version)
    echo "DISPLAY on $DISPLAY"
fi

# Display the date
echo
echo $(date)
echo

# Makes our day a bit more fun....
if type fortune >/dev/null 2>&1; then
    fortune -s
    echo
fi
