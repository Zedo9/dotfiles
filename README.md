# Dotfiles

This repository contains the dotfiles I use on my personal Linux systems. Dotfiles include configuration files for window managers and applications; you will also find scripts (mostly in the bin directory) that I use to perform a range of tasks. Whilst this Github repository was created so that I can access my dotfiles whenever I install or reinstall a system, you are free to use them under the terms of an MIT Licence. However, you should be aware that these files are often a work in progress so I make no guarantees about how well they will work for you.

## What are Dotfiles

Dotfiles are the customization files that are used to personalize your Linux or Unix-based system. You can tell that a file is a dotfile because the name of the file will begin with a dot! The dot at the beginning of a filename or directory name indicates also that it is a hidden file or directory.

## How I manage my Dotfiles between different computers?

- I have this repo cloned on every system I use. Once cloned, I run the `setup_symlink.sh` to link all config files symbolically to their appropriate directories in my Home folder.
- If I encounter any errors while symlinking files, I fix them manually then re-run the script.
- The script accepts these arguments :
  - `Home` For symlinking the content of the working directory to my home folder.
  - `Config` For symlinking the content of the `.config` directory.

# My setup

## Linux distributions

The first Linux distribution I used was Pop Os. I did stick with Pop for more than 9 months and it's still one my favorite full Linux distributions. I switched in mid 2021 to Arch Linux as my understanding of Linux systems has improved so much during my time with Pop OS and I wanted to create my system and customize it from scratch.

## Favorite apps and Window managers

My setup is fairly simple, I switch regularly between 3 different setups :

1. Awesome WM + Rofi + Picom Main/[Jonaburg's fork](https://github.com/jonaburg/picom)
2. Sway WM + Waybar + Swaylock + Dunst + Wofi/sway-launcher-desktop
3. Dwm + Dwmblocks + Dmenu + Dunst + Picom (Check out [my personal builds of suckless tools](https://github.com/Zedo9/suckless-tools))

I have two other setups that I don't really use a lot :

1. i3 WM + Polybar + i3lock + Dunst + Rofi + Picom
2. Qtile + Dunst + Rofi + Picom

I also sometimes switch to full desktop environments such as Xfce4 or KDE.

Apps :

- **Display Managers** : ly - Lightdm - No display manager (startx FTW)
- **Terminal Emulator** : Alacritty
- **Browsers** : Firefox - Brave - [Ungoogled Chromium](https://github.com/Eloston/ungoogled-chromium)
- **File Managers** : Nautilus - Ranger
- **Text editors and IDEs** : Neovim - Geany - VSCode - Intellij

You can find the list of packages that I typically use in [my install-scripts repository](https://github.com/Zedo9/install-scripts).

# TODO

- [ ] Work on neovim config :
  - Add language servers
  - Add more keybindings
- [ ] Work on zathura config
- [ ] Improve symlink script

# Licence

The content of this repository is licensed under the MIT Licence. Basically, that gives you the right to use, copy, modify, etc. the content how you see fit. You can read the full licence terms [here](https://opensource.org/licenses/MIT).
