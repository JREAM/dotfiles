#!/bin/bash

export email='webmaster@localhost'

# Local
export userDir='/home/jesse/projects/'

# Prod
#export userDir='/var/www'

if [ ! -f $userDir ]; then
  echo "Error: Your config \$userDir does not exist: $userDir"
fi
