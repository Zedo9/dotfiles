#!/bin/sh
lxpolkit &
picom -CGb
# Fix java apps
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1
numlockx on
dwmblocks &
cbatticon &
# volumeicon &
skippy-xd --start-daemon &
dunst &
sh ~/dotfiles/bin/wallpaper.sh
nm-applet &
