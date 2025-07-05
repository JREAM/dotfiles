#!/bin/bash

#
# Toggle Terminator Terminal
# This script toggles the visibility of the Terminator terminal.
# It will bring the existing Terminator window to focus if it's open,
# or launch a new Terminator window if it's not open.

# Required:
# sudo apt install wmctrl xdotool -y

# 1. Make sure this is executable:
# $	chmod +x ./.config/bash/toggle-terminal.sh
#
# 2. Remove Default Hotkey.
# 3. Create custom hotkey
# 		ctrl + alt + t
# 4. Set command to this script
# ./.config/bash/toggle-terminal.sh

#!/bin/bash

# Toggle Terminator Terminal focus or launch if not running
# This script requires xdotool and pgrep

TERMINATOR_PID=$(pgrep -f "terminator") # Find the process ID of Terminator

if [ -z "$TERMINATOR_PID" ]; then
  # Terminator is not running, so launch it
  echo "Terminator is not running. Starting a new instance."
  terminator & # Launch Terminator in the background
else
  # Terminator is running, find its window ID and focus it
  echo "Terminator is running with PID: $TERMINATOR_PID"

  # Search for a window with the Terminator PID and activate it
  # xdotool search returns window IDs associated with the PID
  WINDOW_ID=$(xdotool search --pid "$TERMINATOR_PID" | tail -n 1) # Get only the last window ID

  if [ -n "$WINDOW_ID" ]; then
    # Activate the window if found
    echo "Found Terminator window with ID: $WINDOW_ID. Focusing on it."
    xdotool windowactivate "$WINDOW_ID"
  else
    # If process exists but no window found (e.g., hidden), launch a new instance
    echo "Terminator process found, but no associated window. Starting a new instance."
    terminator &
  fi
fi
