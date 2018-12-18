#!/bin/bash

# Many times faster than ack, works w/VSCode regex faaast.
sudo apt install silversearcher-ag -y

if [ ! -d $HOME/apps ] || [ ! -d $HOME/apps/git-shrink ]; then
  mkdir -p $HOME/apps/git-shrink
fi

wget http://repo1.maven.org/maven2/com/madgag/bfg/1.13.0/bfg-1.13.0.jar -O $HOME/apps/git-shrink/bfg-shrink.jar

