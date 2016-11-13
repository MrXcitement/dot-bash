# Display the bash version and DISPLAY setting
if [ "$0" == "-bash" ] || [ "$0" == "bash" ]; then
    # Display the bash version and DISPLAY setting
    printf "${BBlue}This is BASH ${BRed}${BASH_VERSION%.*}${NC}\n"
    if [ $DISPLAY ]; then
        printf "${BBlue}DISPLAY on ${BRed}$DISPLAY${NC}\n"
    fi

else
    echo "This is the $0 (Bourne Shell)"
    if [ $DISPLAY ]; then
        echo "DISPLAY on $DISPLAY"
    fi
fi

# Display the date
echo $(date)
