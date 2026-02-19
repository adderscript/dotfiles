#!/bin/bash

rm -rf ~/dotfiles/.config/*

rsync -a ~/.config/niri ~/dotfiles/.config
rsync -a ~/.config/waybar ~/dotfiles/.config
rsync -a ~/.config/nvim ~/dotfiles/.config
rsync -a ~/.config/kitty ~/dotfiles/.config
rsync -a ~/.config/mako ~/dotfiles/.config
rsync -a ~/.config/fuzzel ~/dotfiles/.config
rsync -a ~/.config/fastfetch/ ~/dotfiles/.config/fastfetch
rsync -a ~/.config/themes/ ~/dotfiles/.config/theme
