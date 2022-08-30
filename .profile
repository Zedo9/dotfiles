[[ -f ~/.zshrc ]] && . ~/.zshrc

# Fix java apps
export AWT_TOOLKIT=MToolkit
export _JAVA_AWT_WM_NONREPARENTING=1

export TERMINAL="kitty"
export VISUAL="nvim"
export EDITOR="nvim"
export BROWSER="firefox"

WAYLAND_FLAGS="--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto --ozone-platform=wayland --high-dpi-support=1"

if [ "$XDG_SESSION_TYPE" = wayland ]; then
  # Wayland specific
  export SDL_VIDEODRIVER=wayland
  export QT_QPA_PLATFORM=wayland-egl
  export GDK_BACKEND=wayland,x11
  export CLUTTER_BACKEND=wayland
  export MOZ_ENABLE_WAYLAND=1
  echo $WAYLAND_FLAGS > ~/.config/code-flags.conf
  echo $WAYLAND_FLAGS > ~/.config/brave-flags.conf
  echo $WAYLAND_FLAGS > ~/.config/chromium-flags.conf
  echo $WAYLAND_FLAGS > ~/.config/electron16-flags.conf # Discord
else
  echo "" > ~/.config/code-flags.conf
  echo "" > ~/.config/brave-flags.conf
  echo "" > ~/.config/chromium-flags.conf
  echo "" > ~/.config/electron16-flags.conf
fi
