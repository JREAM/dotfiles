#!/bin/bash

USE_PATH=$HOME/apps/git-shrink
README="./_README.md"

if [ ! -d $USE_PATH ]; then
  mkdir -p $USE_PATH
fi

wget http://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar -O $USE_PATH/bfg-shrink.jar

if [ -f $README ]; then
  cp $README $USE_PATH/README.md
fi
