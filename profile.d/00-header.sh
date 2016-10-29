# Display the bash version and DISPLAY setting
if [ "$0" == "-bash" ] || [ "$0" == "bash" ]; then
    # Display the bash version and DISPLAY setting
    echo
    printf "${BBlue}This is BASH ${BRed}${BASH_VERSION%.*}${NC}\n"
    if [ $DISPLAY ]; then
	printf "${BBlue}DISPLAY on ${BRed}$DISPLAY${NC}\n"
    fi

else
    echo
    echo "This is the $0 (Bourne Shell)"
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
    if type cowsay >/dev/null 2>&1; then
        if [ "$(uname)" == "Darwin" ]; then
            _COWPATH=/usr/local/Cellar/cowsay/3.04/share/cows
            _COWFILE=$(ls ${_COWPATH}/*cow | gshuf -n1)
        else
            _COWPATH=/usr/share/cowsay/cows
            _COWFILE=$(ls ${_COWPATH}/*cow | shuf -n1)
        fi
        [ $DEBUG ] && echo "fortune -s | cowsay -f ${_COWFILE}"
        fortune -s | cowsay -f ${_COWFILE}
    else
        fortune -s
    fi
fi

echo
