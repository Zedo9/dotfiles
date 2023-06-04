#!/bin/sh
# Args = Config - Home
# Formatting
BOLD=$(tput bold)
red='\033[0;31m'
grn='\033[0;32m'
directory=$(pwd)
folders=$(ls -a "${directory}"/.config)
#TODO : Make dynamic
files=".xinitrc .Xresources .bashrc .profile .dwm"

# $1 source - $2 destination
symlinkFile() {
    if [ ! -L "$2" ]; then
        if [ -e "$2" ]; then
            echo "${red}[ERROR] $2 exists but it's not a symlink. Fix it manually"
        else
            ln -s "$1" "$2"
            echo "${grn}[OK] $1 -> $2"
        fi
    else
        echo "${BOLD}[WARNING] $1 already symlinked"
    fi
}

symlinkConfigFiles() {
    for folder in $folders; do
        if [ "$folder" != "." ] && [ "$folder" != ".." ]; then
            destination="$HOME/.config/${folder}"
            symlinkFile "${directory}/.config/$folder" "$destination"
        fi
    done
}

symlinkHomeFiles() {
    for file in $files; do
        symlinkFile "$directory/$file" "$HOME/$file"
    done
}

for arg in "$@"; do
    symlink"${arg}"Files
done
