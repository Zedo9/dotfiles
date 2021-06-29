#!/bin/sh
# Args = Kde - Config - Home
# Formatting
RED='\033[0;31m'
GREEN="\033[0;32m"
BOLD=$(tput bold)

directory=`pwd`
folders=`ls -a ${directory}/.config`
#TODO : Make dynamic
files=".xinitrc .bashrc .gitconfig .bash_aliases .screenlayout .themes start_sway.sh"

# $1 source - $2 destination
symlinkFile(){
    if [ ! -L $2 ]; then
        if [ -e $2 ]; then
            echo "${RED}[ERROR] $2 exists but it's not a symlink. Fix it manually"
        else
            ln -s $1 $2
            echo "${GREEN}[OK] $1 -> $2"
        fi
    else
        echo "${BOLD}[WARNING] $1 already symlinked"
    fi
}

symlinkConfigFiles(){
    for folder in $folders; do
        if [ "$folder" != "." ] && [ "$folder" != ".." ]; then
            destination="$HOME/.config/${folder}"
            symlinkFile "${directory}/.config/$folder" "$destination"
        fi
    done
}

symlinkHomeFiles(){
    for file in $files; do
        symlinkFile "$directory/$file" "$HOME/$file"
    done
}

for arg in "$@"; do
    symlink${arg}Files
done
