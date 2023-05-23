#!/bin/bash

# Fix for Synaptics X1 Carbon 3rd Touchpad to NOT middle mouse click ever.
xinput set-button-map 13 1 2 4 5 6 7
xinput set-button-map 12 1 0 4 5 6 7 # x1 6g
