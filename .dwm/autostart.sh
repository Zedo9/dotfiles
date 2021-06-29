#!/bin/sh
lxpolkit &
numlockx on
dwmblocks &
# skippy-xd --start-daemon &
dunst &
sh ~/dotfiles/bin/wallpaper.sh
nm-applet &
picom -CGb
