#!/bin/bash

computer=$1

rm -rf ~/dotfiles/.config/*

rsync -a ~/.config/niri ~/dotfiles/$computer
rsync -a ~/.config/waybar ~/dotfiles/$computer
rsync -a ~/.config/nvim ~/dotfiles/$computer
rsync -a ~/.config/kitty ~/dotfiles/$computer
rsync -a ~/.config/mako ~/dotfiles/$computer
rsync -a ~/.config/fuzzel ~/dotfiles/$computer
rsync -a ~/.config/fastfetch/ ~/dotfiles/$computer/fastfetch
