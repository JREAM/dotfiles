#!/bin/bash

# Disables the touchpad for 0.2 seconds when typing
if ! pgrep -x syndaemon >/dev/null; then
  syndaemon -K -i 0.4 -R -d
  # debug
  # echo -e "[+] Starting: syndaemon (touchpad/keyboard ~/.xinitrc)"
fi

