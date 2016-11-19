# path-dotnet.sh --- Add the dotnet path to the path
#
# If the dotnet app exists, add it's path to the path 
#
# Mike Barker <mike@thebarkers.com>
# November 11th, 2016

DOTNETPATH=/usr/local/share/dotnet
if [ -f ${DOTNETPATH}/dotnet ]; then
    PATH=$PATH:${DOTNETPATH}
fi
