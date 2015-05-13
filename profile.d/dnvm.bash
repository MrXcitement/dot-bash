# dnvm.bash --- .Net Version Manager command line tools

# Mike Barker <mike@thebarkers.com>
# May 12th, 2015


# Only source the dnvm file if it exists.
if $(hash dnvm.sh 2>/dev/null);  then
    . dnvm.sh
fi
