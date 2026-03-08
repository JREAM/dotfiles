#!/bin/bash

# For Gnome + Wayland
# 1: Install Window Calls Extension
#    https://extensions.gnome.org/extension/4724/window-calls/
#
# 2: $ chmod +x this file
#
# 3: Edit Shortcuts GUI
#    - Launchers -> Launch Terminal (Disabled)
#    - Custom Shortcuts -> "Terminal" ->
#    - Command: /home/jesse/.config/bash/toggle-terminal-wayland.sh
#      Must use Absolute path not ~/

# 1. Fetch the raw output
RAW_DATA=$(gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell/Extensions/Windows --method org.gnome.Shell.Extensions.Windows.List)

# 2. Extract the JSON string between the single quotes
# This uses Perl-compatible regex to find everything between the first and last '
CLEAN_JSON=$(echo "$RAW_DATA" | grep -oP "(?<='\[).*(?=\]')")
# Re-add the brackets because the grep above strips them for safety
CLEAN_JSON="[$CLEAN_JSON]"

# 3. Use jq to find the Terminator ID
TERMID=$(echo "$CLEAN_JSON" | jq -r '.[] | select(.wm_class == "terminator") | .id' | head -n 1)

# 4. Logic check
if [[ -n "$TERMID" && "$TERMID" != "null" ]]; then
    echo "Focusing Terminator (ID: $TERMID)..."
    gdbus call --session --dest org.gnome.Shell --object-path /org/gnome/Shell/Extensions/Windows --method org.gnome.Shell.Extensions.Windows.Activate "$TERMID"
else
    echo "Terminator not found or not running. Launching..."
    /usr/bin/terminator &
fi
