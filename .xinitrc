#!/bin/sh
xrandr --auto
# startdwm
dbus-launch --sh-syntax --exit-with-session dwm
