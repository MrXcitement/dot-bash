# function-vmd.bash --- View MarkDown function
# Mike Barker <mike@thebarkers.com>
# March 2nd, 2019

# See: pandoc website for info regarding markdown
# formats that are supported.
# https://pandoc.org/

# Check for required apps
PANDOC_APP=$(command -v pandoc)
LYNX_APP=$(command -v lynx)
if [ -z $PANDOC_APP ] || [ -z $LYNX_APP ]; then
    return
fi

# Create function to view markdown files
vmd() {
    pandoc $1 | lynx -stdin
}
