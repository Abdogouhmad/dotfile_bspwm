#!/bin/sh

# Define path variable
BIN_PATH="/usr/bin/"

# Set keyboard layout
setxkbmap us

# Start pipewire services
# ${BIN_PATH}pipwire &
# ${BIN_PATH}pipwire-pulse &
# ${BIN_PATH}pipwire-media-session &

# Start compositor
picom -fb &

# Start hotkey daemon
sxhkd &

# Start window manager
exec bspwm
