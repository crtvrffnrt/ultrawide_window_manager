#!/bin/bash
SCREEN_WIDTH=3840
SCREEN_HEIGHT=1050
# Find the window ID of the GNOME Terminal by class name
WINDOW_ID=$(wmctrl -lx | grep -i "gnome-terminal-server.Gnome-terminal" | awk '{print $1}')
FIREFOX_WINDOW_ID=$(wmctrl -lx | grep -i "Navigator.firefox-esr" | awk 'NR==1{print $1}')
XMIND_WINDOW_ID=$(wmctrl -lx | grep -i "xmind.Xmind" | awk '{print $1}')
# Check if the Firefox window was found
if [ -z "$FIREFOX_WINDOW_ID" ]; then
    echo "No Firefox window found."
    exit 1
fi
# Resize and move the terminal window to the right side of the screen
if [ -n "$WINDOW_ID" ]; then
	wmctrl -i -r "$WINDOW_ID" -e 0,2511,0,1324,1000
	wmctrl -i -a "$WINDOW_ID"

else
    echo "Terminal window not found."
fi

if [ -n "$FIREFOX_WINDOW_ID" ]; then
	FIREFOX_WIDTH=1448
	FIREFOX_HEIGHT=1088
	FIREFOX_X=1087
	FIREFOX_Y=14 
	wmctrl -i -r "$FIREFOX_WINDOW_ID" -e 0,$FIREFOX_X,$FIREFOX_Y,$FIREFOX_WIDTH,$FIREFOX_HEIGHT
	wmctrl -i -a "$FIREFOX_WINDOW_ID"
else
    echo "No Firefox window found."
fi

# Check if the XMIND window was found
if [ -n "$XMIND_WINDOW_ID" ]; then
	XMIND_WIDTH=1111  # Half of the screen width
	XMIND_HEIGHT=$SCREEN_HEIGHT  # Full screen height
        wmctrl -i -r "$XMIND_WINDOW_ID" -e 0,0,0,$XMIND_WIDTH,$XMIND_HEIGHT
	wmctrl -i -a "$XMIND_WINDOW_ID"
else
    echo "No XMIND window found."
fi
