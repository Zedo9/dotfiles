# startup script for sway from console

export QT_QPA_PLATFORMTHEME=qt5ct
export XDG_CURRENT_DESKTOP=Unity
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
XDG_CURRENT_DESKTOP=sway

# see https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
[[ $( hostname ) == nina ]] && export WLR_NO_HARDWARE_CURSORS=1

exec dbus-launch --sh-syntax --exit-with-session sway 
#exec dbus-run-session sway
