# function-vmd.bash --- View MarkDown function
# Mike Barker <mike@thebarkers.com>
# March 2nd, 2019

# See: pandoc website for info regarding markdown
# formats that are supported.
# https://pandoc.org/

# Check for required apps
PANDOC_PATH=$(command -v pandoc)
LYNX_PATH=$(command -v lynx)
if [ -z $PANDOC_PATH ] || [ -z $LYNX_PATH ]; then
    return
fi

# Create function to view markdown files
vmd() {
    pandoc $1 | lynx -stdin
}
