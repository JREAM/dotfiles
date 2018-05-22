#!/bin/bash

#
# This will only load upon login
#

KEYPATH=~/.ssh/jream_rsa

[[ -f $KEYPATH ]] && ssh-add $KEYPATH
