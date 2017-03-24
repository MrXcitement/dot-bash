# functions.bash --- system wide utility functions
# Mike Barker <mike@thebarkers.com>
# March 8th, 2017

# change the current terminal's title (or tab title)
function title {
    echo -ne "\033k"$*"\033\\"
}
