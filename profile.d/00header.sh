# Display the bash version and DISPLAY setting
if [ $BASH ]; then
    # Display the bash version and DISPLAY setting
    echo
    printf "${BBlue}This is BASH ${BRed}${BASH_VERSION%.*}${NC}\n"
    if [ $DISPLAY ]; then
	printf "${BBlue}DISPLAY on ${BRed}$DISPLAY${NC}\n"
    fi

else
    echo
    echo "This is the 'sh' (Bourne Shell)"
    if [ $DISPLAY ]; then
	echo "DISPLAY on $DISPLAY"
    fi
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
