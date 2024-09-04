# Ultrawide Window Manager for Debian XFCE

## Description

I created this script because I love using **PowerToys FancyZones** on Windows to manage window layouts, but I couldn't find the right tool that could split my ultrawide monitor into **3 zones** (left, middle, right) on **Debian XFCE**. That's why I created this script, which arranges 3 specific windows in predefined zones.

This script uses **wmctrl** to automatically resize and move windows like Firefox, GNOME Terminal, and XMIND. It’s perfect for users with ultrawide monitors who want a way to manage window layouts efficiently in a Linux environment.

### Features:
- Automatically resizes and positions three windows (GNOME Terminal, Firefox, and XMIND).
- Positions the terminal window on the right, Firefox in the middle, and XMIND on the left.
- Works seamlessly with ultrawide monitors.

## Installation

1. First, you need to install `wmctrl`, the tool that allows you to manipulate windows via the command line.

   **For Debian/Ubuntu-based systems**:
   ```bash
   sudo apt install wmctrl
## Clone
1. git clone https://github.com/yourusername/ultrawide-window-manager.git
2. cd ultrawide-window-manager
3. chmod +x ultrawide_window_manager.sh

## Run
./ultrawide_window_manager.sh

## Customization
### Adjusting Window Classes:

If you're using a different terminal or browser (e.g., Chrome or another terminal emulator), you'll need to modify the window class names in the script. For example:
- Change "Navigator.firefox-esr" to "Google-chrome.Google-chrome" for Chrome.
- Change "gnome-terminal-server.Gnome-terminal" to match your terminal class.

### Adjusting Window Sizes and Positions:

You can adjust the SCREEN_WIDTH, SCREEN_HEIGHT, and the specific dimensions/coordinates for each window as per your screen resolution and preferences.

### Shortcut Setup

To set up a keyboard shortcut to run the script (e.g., bind it to Ctrl + O):

Open Settings in XFCE, and navigate to Keyboard → Application Shortcuts.
Click Add, and in the dialog box, provide the path to the script:

/bin/sh /path/to/ultrawide_window_manager.sh &2>/dev/null

Assign a key combination (for example, Ctrl + O).
Press OK to save.

Now, every time you press Ctrl + O, the windows will automatically resize and move to their predefined zones.
