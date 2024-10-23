# Dotfiles

This repository contains the dotfiles I use on my personal system. Dotfiles include configuration files for window managers and applications; you will also find scripts that I use to automate a range of tasks.

## How to install

You need to have `git` and `stow` installed.

1. Clone into your home directory
1. Run `stow` to symlink everything or just select what you want

```sh
stow *
```

```sh
stow term # Just for shell related configuration (zsh, bash, nvim, tmux...)
```

_Be aware that these files are often a work in progress so I make no guarantees about how well they will work for you._
