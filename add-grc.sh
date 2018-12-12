#!/bin/bash

sudo apt install grc;

echo "[+] Check your ~/.grc path and ensure it exists."

echo "[+] If it looks good, add this to a .bashrc type file"
echo ''
echo 'if hash grc &>/dev/null; then
  if [ -f "$HOME/.grc/grc.bashrc ]; then
    source "$HOME/.grc/grc.bashrc
  fi
fi'
echo ''
echo "[!] If using Jesse/JREAM's dotfiles its already set in ~/.bash_vendors"
echo ''
