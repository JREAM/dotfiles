#!/bin/sh

USE_PATH=$HOME/apps/vhost

while true; do
    echo -p "[!] Install to: $USE_PATH"
    read -p "[?] Ready to Add? [y/N]" yn
    case $yn in
        [Yy]* )
          echo -e "[+] Creating Path: $USE_PATH"
          if [ ! -d $USE_PATH ] && mkdir -p $USE_PATH

          echo "[+] Creating Symlink: $ vhost "
          sudo ln -s $USE_PATH/vhost.sh /usr/bin/vhost

          echo "[+] Creating Symlink: $ vhost-nginx "
          sudo ln -s $USE_PATH/vhost-nginx.sh /usr/bin/vhost-nginx

          echo "If symlinks were made, type $ vhost or $ vhost-nginx"
          break;;

        [Nn]* ) exit;;

        * ) echo "Please answer yes or no.";;
    esac
done
