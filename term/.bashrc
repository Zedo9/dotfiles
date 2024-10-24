#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f ~/.config/shell/aliases ]; then
	source "$HOME"/.config/shell/aliases
fi

if [ -f ~/.config/shell/shellenv ]; then
	source "$HOME"/.config/shell/shellenv
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
export HISTSIZE=1000
export HISTFILESIZE=2000
export HISTFILE="$XDG_STATE_HOME"/bash/history

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export force_color_prompt=yes

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
# if ! shopt -oq posix; then
# 	if [ -f /usr/share/bash-completion/bash_completion ]; then
# 		. /usr/share/bash-completion/bash_completion
# 	elif [ -f /etc/bash_completion ]; then
# 		. /etc/bash_completion
# 	fi
# fi

export NVM_DIR="$HOME/.config/nvm"
plugin_files=(
	# fzf
	/usr/share/fzf/key-bindings.bash
	/usr/share/fzf/completion.bash
	~/.config/fzf/fzf.sh
	# nvm
	"$NVM_DIR/nvm.sh"
	"$NVM_DIR/bash_completion"
)

for plugin_file in "${plugin_files[@]}"; do
	# shellcheck source=/dev/null
	[ -f "$plugin_file" ] && source "$plugin_file"
done

eval "$(starship init bash)"
