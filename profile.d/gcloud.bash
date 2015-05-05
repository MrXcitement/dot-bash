# gcloud.bash --- Setup command line access to Google Cloud SDK

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# History:
# 2014.10.24
# * First release.

# 2015.02.10
# * Only source files when they exist.

# The next line updates PATH for the Google Cloud SDK.
GCLOUD_PATH="${HOME}/bin/google-cloud-sdk/path.bash.inc"
if [ -f $GCLOUD_PATH ]
then
    . $GCLOUD_PATH
fi

# The next line enables bash completion for gcloud.
GCLOUD_COMPLETE="${HOME}/bin/google-cloud-sdk/completion.bash.inc"
if [ -f $GCLOUD_COMPLETE ]
then
    . $GCLOUD_COMPLETE
fi
