#!/bin/sh

/usr/lib/polkit-kde-authentication-agent-1 &
picom -CGb
numlockx on
export PATH=$PATH:$HOME/dotfiles/scripts/bin
x-custom-gamma
dwmblocks &
cbatticon &
dunst &
wallpaper
nm-applet &
x-night-light &

# Faster keyboard rate
xset r rate 240 50 &
