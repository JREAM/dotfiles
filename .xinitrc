#!/bin/bash

# xinput
# find the ID w/Syntapics Touchpad
# Disable the annoying middle click altoghter, the "0"
xinput set-button-map 10 1 0 4 5 6 7 # t480s

# This slows down the crazy scroll, X11 anyways
synclient \
  VertScrollDelta=500 \
  HorizScrollDelta=700 \
  CoastingSpeed=10 \
  CoastingFriction=20 \
  PressureMotionMinZ=120

# Touch a tap bit harder to move
synclient \
  FingerLow=20 \
  FingerHigh=40 \
  TapButton1=1 \
  TapButton2=3 \
  TapButton3=2 \

# This make the touchpad pretty decent on t480s
synclient \
  AreaLeftEdge=2000 \
  AreaRightEdge=5000

# Disables the touchpad for 0.2 seconds when typing
syndaemon -K -i 0.2 -R -d


#xinput set-prop 10 "libinput Scrolling Pixel Distance" 50



