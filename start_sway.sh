#!/bin/sh
export EDITOR=nvim
export TERM=alacritty

export LIBSEAT_BACKEND=logind

export GTK_THEME=Dracula
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

# Force firefox into wayland and enable hw video decoding (ff 75+)
export MOZ_ENABLE_WAYLAND=1
export MOZ_WAYLAND_USE_VAAPI=1
export MOZ_DBUS_REMOTE=1
export GTK_CSD=0

# qt wayland
export QT_QPA_PLATFORM="wayland"
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
export QT_QPA_PLATFORM=wayland-egl
export QT_WAYLAND_FORCE_DPI=physical

# Fixes issues on jetbrains ides
export _JAVA_AWT_WM_NONREPARENTING=1

# see https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
export WLR_NO_HARDWARE_CURSORS=1
export WLR_DRM_NO_MODIFIERS=1

exec dbus-run-session sway
