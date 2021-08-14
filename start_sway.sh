#!/bin/sh
export EDITOR=nvim

export GTK_THEME=Dracula

# Most pure GTK3 apps use wayland by default, but some,
# like Firefox, need the backend to be explicitely selected.
export MOZ_ENABLE_WAYLAND=1
export MOZ_DBUS_REMOTE=1
export GTK_CSD=0

# qt wayland
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

#Java XWayland blank screens fix
_JAVA_AWT_WM_NONREPARENTING=1

# see https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
export WLR_NO_HARDWARE_CURSORS=1
# exec dbus-launch --sh-syntax --exit-with-session sway
exec dbus-launch sway
