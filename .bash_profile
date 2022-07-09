#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Wayland specific configs
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  export QT_QPA_PLATFORM=wayland  
  export MOZ_ENABLE_WAYLAND=1
fi
