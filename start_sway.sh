#!/bin/sh
export LIBSEAT_BACKEND=logind
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_CURRENT_DESKTOP=sway
export DESKTOP_SESSION=sway

export GTK_THEME=Dracula
export QT_QPA_PLATFORMTHEME=qt5ct
#export XDG_CURRENT_DESKTOP=Unity
export MOZ_ENABLE_WAYLAND=1

# see https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
#[[ $( hostname ) == nina ]] && export WLR_NO_HARDWARE_CURSORS=1
export WLR_NO_HARDWARE_CURSORS=1

exec dbus-run-session sway $@