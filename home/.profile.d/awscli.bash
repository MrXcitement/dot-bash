#!/bin/bash

# amazon-aws.bash --- Configure Amazon Web Services
# If there is an aws credentials file, configure the aws cli to use
# the credentials file and turn on tab completion support.

# Author: Mike Barker <mike@thebarkers.com>
# Created: May 8th, 2015

# History:
# 2015.05.08
# * First release.
# 2016.10.04
# Check if aws cli is installed

if [[ $(type -P aws) ]]; then
    credentials="/Users/mike/.aws/credentials"
    if [ -f $credentials ]; then
        export AWS_CREDENTIAL_FILE=$credentials
        complete -C "$(command -v aws_completer)" aws
    fi
fi
