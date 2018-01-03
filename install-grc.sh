#!/bin/bash

echo "[+] Installing grc"
sudo apt install grc

echo "[+] Cloning grc settings from Github"
git clone https://github.com/garabik/grc.git

echo "[+] Installing grc settings for current user"
cd grc
sudo ./install.sh
rm -rf grc

echo "[+] Copying ~/.grc/grc.bashrc to /etc/grc.bashrc"
sudo cp ~/.grc/grc.bashrc /etc

echo "[*] Complete. Try running: $ . ~/.bashrc"
