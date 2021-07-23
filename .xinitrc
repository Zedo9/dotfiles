#!/bin/sh
xrandr --auto

# exec dbus-run-session --sh-syntax --exit-with-session awesome
exec dbus-launch --sh-syntax --exit-with-session awesome
