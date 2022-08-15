#!/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -CGb
numlockx on
xgamma -gamma 0.8
dwmblocks &
cbatticon &
# skippy-xd --start-daemon &
dunst &
wallpaper
nm-applet &
