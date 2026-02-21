#!/bin/bash

computer=$1

rm -rf ~/dotfiles/.config/*

rsync -a ~/.config/niri ~/dotfiles/config-$computer
rsync -a ~/.config/waybar ~/dotfiles/config-$computer
rsync -a ~/.config/nvim ~/dotfiles/config-$computer
rsync -a ~/.config/kitty ~/dotfiles/config-$computer
rsync -a ~/.config/mako ~/dotfiles/config-$computer
rsync -a ~/.config/fuzzel ~/dotfiles/config-$computer
rsync -a ~/.config/fastfetch/ ~/dotfiles/config-$computer/fastfetch
