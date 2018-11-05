# path-snap.sh --- Append the snap bin folder to the path
#
# Mike Barker <mike@thebarkers.com>
# November 4th, 2018

NEW_PATH="/snap/bin"
if [ -d $NEW_PATH ]; then
    PATH=$PATH:$NEW_PATH
fi
