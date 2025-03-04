#!/bin/bash
# ┌─────────────────────────────────────────────────────────────────┐
# │ includes/fn 																										│
# └─────────────────────────────────────────────────────────────────┘

# Rename Files
# ──────────────────────────────────────────────────────────────────
# Usage: mklink
mklink() {
	# Help message
	if [ -z "$1" ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
		echo "Usage: mklink <AppImage file> <AppName>"
		echo "Creates a shortcut for an AppImage file in the application list."
		echo ""
		echo "Arguments:"
		echo "  <AppImage file>  Path to the AppImage file."
		echo "  <AppName>        Name for the application (required)."
		return 1
	fi

	# Check if the AppImage file exists
	if [ ! -f "$1" ]; then
		echo "Error: AppImage file '$1' not found."
		echo "Usage: mklink <AppImage file> <AppName>"
		return 1
	fi

	# Check if the second argument (AppName) is provided
	if [ -z "$2" ]; then
		echo "Error: Application name (second argument) is required."
		echo "Usage: mklink <AppImage file> <AppName>"
		return 1
	fi

	APPDIR="$HOME/Applications"
	APPFILE="$1"
	APPNAME="$2"
	DESKTOPFILE="$XDG_DATA_HOME/applications/$APPNAME.desktop"

	# Ensure the Applications directory exists
	mkdir -p "$APPDIR"

	# Move the AppImage to the Applications directory if it's not already there
	if [ "$(dirname "$APPFILE")" != "$APPDIR" ]; then
		mv "$APPFILE" "$APPDIR/"
		APPFILE="$APPDIR/$(basename "$APPFILE")"
	fi

	# Make the AppImage executable
	chmod +x "$APPFILE"

	# Create the desktop entry
	cat >"$DESKTOPFILE" <<EOL
[Desktop Entry]
Name=$APPNAME
Exec="$APPFILE" %U
Terminal=false
Type=Application
Icon=$APPNAME
StartupWMClass=$APPNAME
Comment=$APPNAME
Categories=Utility;Application;
EOL

	echo "Shortcut created for $APPNAME in the application list."
}
