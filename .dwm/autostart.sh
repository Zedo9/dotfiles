#!/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -CGb
numlockx on
dwmblocks &
cbatticon &
# skippy-xd --start-daemon &
dunst &
wallpaper
/usr/bin/prime-offload
optimus-manager-qt &
nm-applet &
