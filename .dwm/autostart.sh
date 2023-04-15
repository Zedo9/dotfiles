#!/bin/sh

xrandr --output eDP --set TearFree on
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
picom -CGb
numlockx on
export PATH="$PATH":"$HOME"/dotfiles/scripts/bin
x-custom-gamma
playerctld daemon
# For java apps to work
wmname "LG3D" 
export _JAVA_AWT_WM_NONREPARENTING=1

dwmblocks &
cbatticon &
dunst &
x-wallpaper
nm-applet &
x-night-light &
xsettingsd &
easyeffects --gapplication-service &
keyring

systemctl --user import-environment DISPLAY
clipmenud &
# Faster keyboard rate
xset r rate 240 50
