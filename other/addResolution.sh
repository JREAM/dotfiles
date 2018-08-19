#!/bin/bash

echo "[!] Please update the variables within here to the resolution"
echo "    you want to add. Then run the app again."
echo ""
echo "[!] Run $ xrandr and get the \"NAME connected primary ..."
echo "    When complete, update the variables in this file and remove the exit."
exit 1

DISPLAY="Virtual1"    # Change to Correct
SIZE="1980 1020"      # Adjust to what you want

cvt $SIZE

echo "[!] Copy the above right after Modeline, beginning with \"$SIZE ...\" until the end."
echo "    Then run this command manually:"
echo ""
echo "    sudo xrandr --newmode \"<text-from-previous-copy>\""
xhost si:localuser:root

echo "[!] Once that is run, copy the quotes text, and run this command:"
sudo xrandr --addmode $DISPLAY  "\Text Here like: 1920x1080_60.00"

echo "[+] Without Errors, you should be able to change your resolution!"
echo "[+] Add the last TWO commands in your ~/.profile (without the sudo) to set it for good"
echo ""
echo "[Complete]"

