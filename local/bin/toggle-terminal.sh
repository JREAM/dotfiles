#!/bin/bash
# shellcheck disable=SC2086,SC2154,SC1091
# ╔═════════════════════════════════════════════════════════════════╗
# ║ TOGGLE_TERMINAL                                                 ║
# ╚═════════════════════════════════════════════════════════════════╝
# [Pkg]     $ apt install wmctrl
# [Doc]     Place in ~/.local/usr/bin

export DISPLAY=:0
# Add this at the top of your script
LOGFILE="/tmp/toggle-terminal.log"
echo "$(date): Running toggle-terminal script" >> $LOGFILE


# Function to get the default terminal emulator
get_default_terminal() {
  if command -v x-terminal-emulator > /dev/null; then
    echo "x-terminal-emulator"
  elif command -v gnome-terminal > /dev/null; then
    echo "gnome-terminal"
  elif command -v terminator > /dev/null; then
    echo "terminator"
  else
    echo "gnome-terminal"  # Fallback to gnome-terminal if nothing else works
  fi
}

# Get the default terminal
DEFAULT_TERMINAL=$(get_default_terminal)
echo "Using terminal: $DEFAULT_TERMINAL"

# Identify terminal window classes
TERMINAL_CLASSES="gnome-terminal.Terminal|terminator.Terminator|x-terminal-emulator.X-terminal-emulator"
# For Warp and Wave append: "dev.warp.Warp.dev.warp.Warp|wave.Wave"
# The first priority comes first I believe, I dont use them as much as terminator thouhg.

# Check for an existing terminal window
WINDOW_ID=$(wmctrl -lx | grep -E "$TERMINAL_CLASSES" | awk '{print $1}')
echo "Window ID found: $WINDOW_ID"

if [ -n "$WINDOW_ID" ]; then
  echo "Focusing terminal window: $WINDOW_ID"
  wmctrl -ia "$WINDOW_ID"
else
  echo "No terminal window found. Launching a new one."
  $DEFAULT_TERMINAL &
fi

