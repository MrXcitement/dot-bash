# z.bash --- initialize the z jump command
# Mike Barker <mike@thebarkers.com>
# October 2nd, 2018

# Load the z.sh file if it exists
Z_SH=/usr/local/etc/profile.d/z.sh

if [[ -f $Z_SH ]]; then
    . $Z_SH
fi
