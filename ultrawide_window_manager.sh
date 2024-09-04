#!/bin/bash

# Set the screen width and height (adjust based on your monitor resolution)
SCREEN_WIDTH=3840
SCREEN_HEIGHT=1050

# Find the window ID of the GNOME Terminal by class name
# This will match any GNOME Terminal window (adjust class name if using a different terminal)
WINDOW_ID=$(wmctrl -lx | grep "gnome-terminal-server.Gnome-terminal" | awk '{print $1}')

# Find the first Firefox window
# Change "Navigator.firefox-esr" if you use a different version or browser (such as Chrome)
FIREFOX_WINDOW_ID=$(wmctrl -lx | grep "Navigator.firefox-esr" | awk 'NR==1{print $1}')

# Find the XMIND window (adjust the class name if you're using a different mind-mapping tool)
XMIND_WINDOW_ID=$(wmctrl -lx | grep "xmind.Xmind" | awk '{print $1}')

# Check if the Firefox window was found
# Exit the script if no Firefox window is found
if [ -z "$FIREFOX_WINDOW_ID" ]; then
    echo "No Firefox window found."
    exit 1
fi

# Resize and move the terminal window to the right side of the screen
# Adjust the size (1324x1000) and position (X=2511) based on your needs
if [ -n "$WINDOW_ID" ]; then
    wmctrl -i -r "$WINDOW_ID" -e 0,2511,0,1324,1000
    wmctrl -i -a "$WINDOW_ID"  # Bring the terminal to the foreground
else
    echo "Terminal window not found."
fi

# Move and resize the Firefox window to the specific position (X=1171, Y=14)
if [ -n "$FIREFOX_WINDOW_ID" ]; then
    FIREFOX_WIDTH=1364
    FIREFOX_HEIGHT=1088
    FIREFOX_X=1171
    FIREFOX_Y=14
    wmctrl -i -r "$FIREFOX_WINDOW_ID" -e 0,$FIREFOX_X,$FIREFOX_Y,$FIREFOX_WIDTH,$FIREFOX_HEIGHT
    wmctrl -i -a "$FIREFOX_WINDOW_ID"  # Bring Firefox to the foreground
else
    echo "No Firefox window found."
fi

# Check if the XMIND window was found, move and resize it to the left side of the screen
if [ -n "$XMIND_WINDOW_ID" ]; then
    XMIND_WIDTH=1195  # Width for XMIND window
    XMIND_HEIGHT=$SCREEN_HEIGHT  # Full screen height
    wmctrl -i -r "$XMIND_WINDOW_ID" -e 0,0,0,$XMIND_WIDTH,$XMIND_HEIGHT
    wmctrl -i -a "$XMIND_WINDOW_ID"  # Bring XMIND to the foreground
else
    echo "No XMIND window found."
fi
