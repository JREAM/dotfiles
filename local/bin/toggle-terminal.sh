#!/bin/bash
# shellcheck disable=SC2086,SC2154,SC1091
# ╔═════════════════════════════════════════════════════════════════╗
# ║ TOGGLE_TERMINAL                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]     $ apt install wmctrl
# [Doc]     Place in ~/.local/usr/bin

# Get the default incase I change it later.
TERMINAL=$(update-alternatives --query x-terminal-emulator | grep 'Value: ' | awk '{print $2}')

# Check if an instance of the terminal is running
if wmctrl -lx | grep -i "$TERMINAL"; then
  # Focus existing terminal
  wmctrl -a "$TERMINAL"
else
  # Create new defualt instance
  "$TERMINAL" &
fi
