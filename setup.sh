#!/bin/sh

# Usage: ./setup.sh [desktop] [term] [xorg] ...

BOLD=$(tput bold)
RESET=$(tput sgr0)
RED=$(tput setaf 1)
GRN=$(tput setaf 2)
YEL=$(tput setaf 3)

SOURCE_DIR="$(cd "$(dirname "$0")" && pwd)"

CONFIG_TARGET="${HOME}/.config"
HOME_TARGET="${HOME}"
SCRIPTS_TARGET="${HOME}/.local/bin"

mkdir -p "$CONFIG_TARGET" "$SCRIPTS_TARGET"

# Symlink file or folder: $1 = source, $2 = destination
symlink_file() {
    src="$1"
    dst="$2"

    if [ -L "$dst" ]; then
        echo "${YEL}${BOLD}[SKIP] Already symlinked:${RESET} $dst"
    elif [ -e "$dst" ]; then
        echo "${RED}[ERROR] Exists but is not a symlink:${RESET} $dst"
    else
        ln -s "$src" "$dst"
        echo "${GRN}[OK] Linked:${RESET} $src → $dst"
    fi
}

# $1 = source_dir, $2 = target_dir
symlink_dir_contents() {
    src_dir="$1"
    dst_dir="$2"

    [ ! -d "$src_dir" ] && return

    for pattern in "$src_dir"/* "$src_dir"/.[!.]* "$src_dir"/..?*; do
        [ -e "$pattern" ] || continue # skip if no matches

        name=$(basename "$pattern")

        # skip '.' and '..' explicitly
        if [ "$name" = "." ] || [ "$name" = ".." ]; then
            continue
        fi

        symlink_file "$pattern" "$dst_dir/$name"
    done

}

# Main logic
if [ "$#" -eq 0 ]; then
    echo "${RED}No arguments provided. Usage: $0 [desktop] [term] [xorg] ...${RESET}"
    exit 1
fi

for folder in "$@"; do
    folder_path="$SOURCE_DIR/$folder"
    [ -d "$folder_path" ] || {
        echo "${RED}[ERROR] Not a valid folder:${RESET} $folder"
        continue
    }

    # Symlink contents if subdirectories exist
    [ -d "$folder_path/config" ] && symlink_dir_contents "$folder_path/config" "$CONFIG_TARGET"
    [ -d "$folder_path/home" ] && symlink_dir_contents "$folder_path/home" "$HOME_TARGET"
    [ -d "$folder_path/scripts" ] && symlink_dir_contents "$folder_path/scripts" "$SCRIPTS_TARGET"
done
