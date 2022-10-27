# Dotfiles

This repository contains the dotfiles I use on my personal Linux systems. Dotfiles include configuration files for window managers and applications; you will also find scripts (mostly in the `scripts/bin` directory) that I use to perform a range of tasks. Whilst this Github repository was created so that I can access my dotfiles whenever I install or reinstall a system. You are free to use them under the terms of an MIT License. However, you should be aware that these files are often a work in progress so I make no guarantees about how well they will work for you.

![](https://i.imgur.com/kI0e8hX.png)
![](https://i.imgur.com/nEJsIg7.png)

## What are Dotfiles

Dotfiles are the customization files that are used to personalize your Linux or Unix-based system. You can tell that a file is a dotfile because the name of the file will begin with a dot. The dot at the beginning of a filename or directory name indicates also that it is a hidden file or directory.

## How I manage my Dotfiles between different setups?

- I have this repo cloned on every system I use. Once cloned, I run the `setup_symlink.sh` to link all config files symbolically to their appropriate directories in my home folder.
- If I encounter any errors while symlinking files, I fix them manually then re-run the script.
- The script accepts these arguments :
  - `Home` For symlinking the content of the working directory to my home folder.
  - `Config` For symlinking the content of the `.config` directory.

# My setup

## Linux distributions

The first Linux distribution I used was Pop Os. I did stick with Pop for more than 9 months. I switched in mid 2021 to Arch Linux as I wanted to create my system and customize it from scratch.

## Favorite apps and Window managers

My setup is fairly simple, I switch regularly between 2 setups :

1. [Hyprland](https://hyprland.org/)
2. [Dwm](https://dwm.suckless.org/)(Check out [my personal builds of suckless tools](https://github.com/Zedo9/suckless-tools))

I also sometimes switch to a full desktop environment (mostly GNOME or KDE).

Apps :

- **Terminal Emulator** : Kitty - Alacritty
- **Browsers** : Firefox - Brave - [Ungoogled Chromium](https://github.com/Eloston/ungoogled-chromium)
- **File Managers** : Nautilus - Ranger
- **Text editors and IDEs** : Neovim - Geany - VSCode - Intellij

You can find the list of packages that I typically use in [my install-scripts repository](https://github.com/Zedo9/install-scripts).

# License

The content of this repository is licensed under the MIT License. Basically, that gives you the right to use, copy, modify, etc. the content how you see fit.
