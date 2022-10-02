#!/bin/sh
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -CGb
numlockx on
export PATH=$PATH:$HOME/dotfiles/scripts/bin
x-custom-gamma
dwmblocks &
cbatticon &
# skippy-xd --start-daemon &
dunst &
wallpaper
nm-applet &
x-night-light &