#!/bin/bash
# ┌─────────────────────────────────────────────────────────────────┐
# │ includes/fn 																										│
# └─────────────────────────────────────────────────────────────────┘

# Mouse Move
# ──────────────────────────────────────────────────────────────────
# Usage: rn lower <files>
mm() {
	LENGTH=1
	DELAY=5

	while true; do
		for ANGLE in 0 90 180 270; do
			xdotool mousemove_relative --polar $ANGLE $LENGTH
			sleep $DELAY
		done
	done
}

