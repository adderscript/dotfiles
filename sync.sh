#!/usr/bin/env bash

set -euo pipefail

dotfilesDir="$HOME/dotfiles"
configSource="$HOME/.config"
configTarget="$dotfilesDir/config"

# 👇 Put only the configs you actually want tracked here
configsToSync=(
    "nvim"
    "foot"
    "fish"
    "fuzzel"
    "niri"
    "waybar"
    "mako"
)

echo "Syncing selected .config folders → dotfiles repo..."

mkdir -p "$configTarget"

for configName in "${configsToSync[@]}"; do
    sourcePath="$configSource/$configName"
    targetPath="$configTarget/$configName"

    if [[ -d "$sourcePath" ]]; then
        echo "→ Syncing $configName"

        rsync -av \
            --delete \
            "$sourcePath/" \
            "$targetPath/"
    else
        echo "⚠️  Skipping $configName (not found)"
    fi
done

echo "Done syncing selected configs."
