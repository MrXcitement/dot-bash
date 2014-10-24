# gcloud.sh --- Setup command line access to Google Cloud SDK

# Copyright (C) 2014 by Mike Barker

# Author: Mike Barker <mike@thebarkers.com>
# Created: October 24, 2014

# History:
# 2014.10.24
# * First release.

# The next line updates PATH for the Google Cloud SDK.
source '${home}/bin/google-cloud-sdk/path.bash.inc'

# The next line enables bash completion for gcloud.
source '${home}/bin/google-cloud-sdk/completion.bash.inc'
