#!/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
# lxpolkit &
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
#ulauncher --hide-window --no-window-shadow &
