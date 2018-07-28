#!/bin/bash

# Source bashrc if bash_profile isn't there
# This is incase .bash_profile isn't loaded below Ubuntu 18

export OS_VERSION=$(printf "%.0f\n" $(lsb_release -rs) )

if [[ $OS_VERSION -lt 18 ]]; then
  # Source It
  . $HOME/.bashrc


  # Desktop Only
  if (( $+commands[xrandr] )) >/dev/null 2>&1; then
    # For Custom Screen Size
    # http://ubuntuhandbook.org/index.php/2017/04/custom-screen-resolution-ubuntu-desktop/
    xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
    xrandr --addmode  Virtual1 "1920x1080_60.00"
  fi
fi
