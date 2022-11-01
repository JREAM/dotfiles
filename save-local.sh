#!/bin/bash
FILES=(
  $XDG_CONFIG_HOME/vim
  $XDG_CONFIG_HOME/terminator
  $XDG_CONFIG_HOME/wgetrc
  $XDG_CONFIG_HOME/git
  $XDG_CONFIG_HOME/X11

  $XDG_CONFIG_HOME/docker
  $XDG_CONFIG_HOME/tmux
  $XDG_CONFIG_HOME/bash_completion
  $XDG_CONFIG_HOME/cheat
  $HOME/.xinitrc
  $HOME/.xprofile
  $HOME/.profile
  $HOME/.bashrc
  $HOME/.bash_alias
  $HOME/.bash_var
  $HOME/.bash_vendor
  $HOME/.myclirc
)

# Create Backup Folders in DropBox
DATE=$(date +"%Y%m%d")
FOLDER="$HOME/Dropbox/my-linux/backup/dotfiles-$HOSTNAME-$DATE"

if [ ! -d ~/Dropbox/my-linux/backup ]; then
  mkdir -p $HOME/Dropbox/my-linux/backup
fi
if [[ ! -d ~/Dropbox/my-linux/backup/$FOLDER ]]; then
  mkdir -p "$HOME/Dropbox/my-linux/backup/$FOLDER"
fi

for item in "${FILES[@]}"; do
  if [ -d "$item" ]; then
    echo -e "$item is dir to dir config/$(basename $item)"
    echo "Copy Directory: $item to $FOLDER"
    rsync -rv --exclude=.git "$item" "$FOLDER"       # Backup First
    rsync -rv --exclude=.git "$item" "./config$item" # item will have a /
    rm "config/$item"
    echo "copied ./config/$item"
    echo "removed ./config/$item"
  elif [[ -f "$item" ]]; then
    echo "$item is file to 'config/$(basename $item)"
    echo "Copy File: $item to $FOLDER"
    rsync -v --exclude=.git "$item" "$FOLDER"
    rsync -v --exclude=.git "$item" "./config/$item"
  fi
done
