#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Fix java apps
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

export TERMINAL="alacritty"
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="firefox"

# Wayland specific configs
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  export QT_QPA_PLATFORM=wayland  
  export MOZ_ENABLE_WAYLAND=1
  export WAYLAND_FLAGS="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --ozone-platform=wayland --high-dpi-support=1"
fi
