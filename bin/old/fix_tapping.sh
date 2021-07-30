#!/bin/sh

#Deprecated ways
#tap_id=`xinput --list-props "Elan Touchpad" | grep "Tapping Enabled (" | cut -c28-30`
#xinput set-prop "Elan Touchpad" $tap_id 1
xinput set-prop "Elan Touchpad" "libinput Tapping Enabled" 1
