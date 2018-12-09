#!/bin/sh

echo "[?] First, have you placed this ./vhost folder in a place you like? I place
mine in ~/apps/vhost. Once you confirm, we will create two symlinks in /usr/bin/vhost & vhost-nginx."


while true; do
    read -p "[?] Ready to create symlinks? [y/N]" yn
    case $yn in
        [Yy]* )
          echo "[ Symlinking $ vhost ]"
          sudo ln -s $PWD/vhost.sh /usr/bin/vhost

          echo "[ Symlinking $ vhost-nginx ]"
          sudo ln -s $PWD/vhost-nginx.sh /usr/bin/vhost-nginx

          echo "If symlinks were made, type $ vhost or $ vhost-nginx"
          break;;

        [Nn]* ) exit;;

        * ) echo "Please answer yes or no.";;
    esac
done
