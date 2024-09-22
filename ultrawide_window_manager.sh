	#!/bin/bash

# Store the ID of the currently active window
CURRENT_WINDOW_ID=$(xdotool getactivewindow)

SCREEN_WIDTH=3840
SCREEN_HEIGHT=1050
# Find the window ID of the GNOME Terminal by class name
## LEFT
Thunar_ID=$(wmctrl -lx | grep -i "Thunar" | awk '{print $1}')
XMIND_WINDOW_ID=$(wmctrl -lx | grep -i "xmind.Xmind" | awk '{print $1}')
Loop_id=$(wmctrl -lx | grep -i "Microsoft Loop" | awk 'NR==1{print $1}')
## MID
FIREFOX_WINDOW_ID=$(wmctrl -lx | grep -i "Navigator.firefox-esr" | awk 'NR==1{print $1}')
CHROME_WINDOWS_ID=$(wmctrl -lx | grep -i "Chrome" | awk 'NR==1{print $1}')
Remmina_WINDOW_ID=$(wmctrl -lx | grep -i "remmina" | awk 'NR==1{print $1}')
Remmina1_WINDOW_ID=$(wmctrl -lx | grep -i "remmina" | awk 'NR==2{print $1}')
Remmina2_WINDOW_ID=$(wmctrl -lx | grep -i "remmina" | awk 'NR==3{print $1}')


## Right
WINDOW_ID=$(wmctrl -lx | grep -i "gnome-terminal-server.Gnome-terminal" | awk '{print $1}')
VSCODE_ID=$(wmctrl -lx | grep -i "Visual Studio Code" | awk '{print $1}')

# Check if the Firefox window was found
if [ -z "$FIREFOX_WINDOW_ID" ]; then
    echo "No Firefox window found."
fi
# Resize and move the terminal window to the right side of the screen
if [ -n "$WINDOW_ID" ]; then
	wmctrl -i -r "$WINDOW_ID" -e 0,2511,0,1324,1000
	wmctrl -i -a "$WINDOW_ID"

else
    echo "Terminal window not found."
fi
# Resize and move the Thunar window to the right side of the screen
if [ -n "$Thunar_ID" ]; then
        wmctrl -i -r "$Thunar_ID" -e 0,2511,0,1324,1000
       ## wmctrl -i -a "$Thunar_ID"

else
    echo "Thunar window not found."
fi


# Set Firefox
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
# Set Chrome
if [ -n "$CHROME_WINDOWS_ID" ]; then
        FIREFOX_WIDTH=1403
        FIREFOX_HEIGHT=1043
        FIREFOX_X=1107
        FIREFOX_Y=36
        wmctrl -i -r "$CHROME_WINDOWS_ID" -e 0,$FIREFOX_X,$FIREFOX_Y,$FIREFOX_WIDTH,$FIREFOX_HEIGHT
        ## wmctrl -i -a "$FIREFOX_WINDOW_ID"
else
    echo "No Firefox window found."
fi
# Set Remmina
if [ -n "$Remmina_WINDOW_ID" ]; then
        FIREFOX_WIDTH=1448
        FIREFOX_HEIGHT=1000
        FIREFOX_X=1087
        FIREFOX_Y=14 
        wmctrl -i -r "$Remmina_WINDOW_ID" -e 0,$FIREFOX_X,$FIREFOX_Y,$FIREFOX_WIDTH,$FIREFOX_HEIGHT
        wmctrl -i -r "$Remmina1_WINDOW_ID" -e 0,$FIREFOX_X,$FIREFOX_Y,$FIREFOX_WIDTH,$FIREFOX_HEIGHT
        wmctrl -i -r "$Remmina2_WINDOW_ID" -e 0,$FIREFOX_X,$FIREFOX_Y,$FIREFOX_WIDTH,$FIREFOX_HEIGHT

else
    echo "No Remminaiwndow found."
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

## Loop

if [ -n "$Loop_id" ]; then
        XMIND_WIDTH=1111  # Half of the screen width
        XMIND_HEIGHT=$SCREEN_HEIGHT  # Full screen height
        wmctrl -i -r "$Loop_id" -e 0,0,0,$XMIND_WIDTH,$XMIND_HEIGHT
        ## wmctrl -i -a "$XMIND_WINDOW_ID"
else
    echo "No XMIND window found."
fi

# Check if the Codewindow was found
if [ -n "$VSCODE_ID" ]; then
        wmctrl -i -r "$VSCODE_ID" -e 0,2511,0,1324,1000
else
    echo "No VSCODE window found."
fi
# Restore focus to the originally active window
if [ -n "$CURRENT_WINDOW_ID" ]; then
    sleep 0.1
    wmctrl -i -a "$CURRENT_WINDOW_ID"
fi

