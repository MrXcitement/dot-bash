# Display the bash version and DISPLAY setting
if [ $BASH ]; then
    # Display the bash version and DISPLAY setting
    echo
    printf "${BCyan}This is BASH ${BRed}${BASH_VERSION%.*}${BCyan}\n"
    if [ $DISPLAY ]; then
	printf "DISPLAY on ${BRed}$DISPLAY${NC}\n"
    fi

else
    echo
    echo $(sh --version)
    echo "DISPLAY on $DISPLAY"
fi

# Display the date
echo
echo $(date)

# Makes our day a bit more fun....
if type fortune >/dev/null 2>&1; then
    echo
    fortune -s
fi

echo
