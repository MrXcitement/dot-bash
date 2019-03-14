#!/bin/bash
# Put a list of remote hosts in ~/.hosts

HOSTFILE="${HOME}/.hosts"
[ -r "${HOSTFILE}" ] && export HOSTFILE
