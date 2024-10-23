#!/bin/zsh

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

for file in ~/.config/shell/{aliases,shellenv}; do
    [[ -f $file ]] && source "$file"
done

autoload -Uz colors compinit
colors
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
_comp_options+=(globdots) # Include hidden files.

zstyle ':completion:*' menu select

export HISTFILE="$XDG_STATE_HOME"/zsh/history
setopt inc_append_history
export HISTSIZE=1000
export SAVEHIST=1000

### Keybinds ###
bindkey -e
export WORDCHARS=''           # Make word jumping like bash in paths
setopt completealiases autocd # Enable alias completion & autocd

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"
key[Alt-Left]="${terminfo[kLFT3]}"
key[Alt-Right]="${terminfo[kRIT3]}"

# setup key accordingly
[[ -n "${key[Alt-Left]}"  ]] && bindkey -- "${key[Alt-Left]}"   backward-word
[[ -n "${key[Alt-Right]}" ]] && bindkey -- "${key[Alt-Right]}"	forward-word
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Make sure the terminal is in application mode, when zle is active.
# Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

_dotnet_zsh_complete()
{
    local completions=("$(dotnet complete "$words")")
    if [ -z "$completions" ]; then
        _arguments '*::arguments: _normal'
    else
        _values "${(ps:\n:)completions}"
    fi
}
compdef _dotnet_zsh_complete dotnet

export NVM_DIR="$HOME/.config/nvm"

plugin_files=(
    # zsh
    /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    # fzf
    /usr/share/fzf/key-bindings.zsh
    /usr/share/fzf/completion.zsh
    ~/.config/fzf/fzf.sh
    # nvm
    "$NVM_DIR/nvm.sh"
    "$NVM_DIR/bash_completion"
)

for plugin_file in "${plugin_files[@]}"; do
    [[ -f "$plugin_file" ]] && source "$plugin_file"
done

eval "$(starship init zsh)"
