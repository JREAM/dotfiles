#!/bin/bash

# -----------------------------------------------
# Legacy: Ubuntu 22+ Uses Libinput also, its odd
# -----------------------------------------------

# xinput
# find the ID w/Syntapics Touchpad
# Disable the annoying middle click altoghter, the "0"
#xinput set-button-map 10 1 0 4 5 6 7 # t480s

# Enable Vert Horiz scrolling
#xinput set-prop 10 "Synaptics Two-Finger Scrolling" 1 1

#
# This slows down the crazy scroll, X11 anyways
synclient \
  VertScrollDelta=500 \
  HorizScrollDelta=700 \
  VertTwoFingerScroll=1 \
  HorizTwoFingerScroll=1 \
  VertEdgeScroll=0 \
  HorizEdgeScroll=0 \
  SingleTapTimeout=100 \
  MaxTapTime=100 \
  MaxTapMove=150 \
  CoastingSpeed=10 \
  CoastingFriction=20 \
  PalmDetect=1 \
  #FingerLow=15 \
  #FingerHigh=25 \
  #PressureMotionMinZ=80 \
  #PressureMotionMaxZ=120 \
  #AccelFactor=0.023 \
  #RightButtonAreaLeft=4000
  #RightButtonAreaTop=3500
  #PressureMotionMinZ=120 \
  #HorizHysteresis=10 \
  #VertHysteresis=10 \
  PalmMinWidth=10 \
  PalmMinZ=150 \
  TapAndDragGesture=0 \
  AreaTopEdge=1900 \
  ClickPad=1

# Touch a tap bit harder to move
#synclient \
  #FingerLow=20 \
  #FingerHigh=40 \
  #TapButton1=1 \
  #TapButton2=3 \
  #TapButton3=2 \

# This make the touchpad pretty decent on t480s
#synclient \
#  AreaLeftEdge=2000 \
#  AreaRightEdge=5000

# Disables the touchpad for 0.2 seconds when typing
if ! pgrep -x syndaemon >/dev/null; then
  syndaemon -K -i 0.2 -R -d
  echo -e "[+] Starting: syndaemon (touchpad/keyboard ~/.xinitrc)"
fi

#xinput set-prop 10 "libinput Scrolling Pixel Distance" 50



