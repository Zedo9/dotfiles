#!/bin/sh
xrandr --output eDP-1 --primary --mode 1366x768 --pos 0x0 --rotate normal --output DP-1 --mode 1600x900 --pos 1366x0 --rotate normal --output HDMI-1 --off --output HDMI-2 --off
sh ~/dotfiles/bin/wallpaper.sh
sh ~/dotfiles/.config/polybar/launch.sh
