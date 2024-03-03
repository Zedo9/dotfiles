#!/bin/sh

[ -f "$HOME"/.bashrc ] && . "$HOME"/.bashrc

# eval $(gnome-keyring-daemon --start)
# export SSH_AUTH_SOCK

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
