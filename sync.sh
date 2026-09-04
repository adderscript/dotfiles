#!/bin/bash

DOTFILES="$HOME/dotfiles"

FOLDERS=(
    "niri"
    "waybar"
    "mako"
    "nvim"
    "alacritty"
    "wallpapers"
    "fuzzel"
    "gtk-4.0"
)

mkdir -p "$DOTFILES"

for folder in "${FOLDERS[@]}"; do
    SOURCE="$HOME/.config/$folder"
    DEST="$DOTFILES/$folder"

    if [ -d "$SOURCE" ]; then
        echo "Copying $folder..."

        rm -rf "$DEST"
        cp -a "$SOURCE" "$DEST"
    else
        echo "Skipping $folder (not found)"
    fi
done

echo "Done!"
