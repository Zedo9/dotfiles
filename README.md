# Dotfiles

This repository contains the dotfiles I use on my personal system. Dotfiles include configuration files for window managers and applications; you will also find scripts (mostly in the `scripts/bin` directory) that I use to automate a range of tasks.

## How to install

```sh
# Clone this repository somewhere (preferably in ~) and cd into it

# Run the symlink script
$ chmod +x setups_symlinks.sh

# This will symlink the content of .config to your ~/.config (If there are any folders that already exist, you will need to backup/remove them somewhere else manually and rerun the script)
$ ./setup_symlink.sh Config

# This will symlink some files in your home directory
$ ./setup_symlink.sh Home

# For scripts to work, make sure you have the <clone_location>/dotfiles/scripts/bin folder added to your $PATH
```

_Be aware that these files are often a work in progress so I make no guarantees about how well they will work for you._
