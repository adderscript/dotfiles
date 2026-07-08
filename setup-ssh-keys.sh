#!/usr/bin/env bash

set -e

EMAIL="$1"

if [ -z "$EMAIL" ]; then
    read -rp "GitHub email: " EMAIL
fi

KEY_PATH="$HOME/.ssh/id_ed25519"

if [ -f "$KEY_PATH" ]; then
    echo "SSH key already exists."
else
    echo "Generating SSH key..."
    ssh-keygen -t ed25519 -C "$EMAIL" -f "$KEY_PATH"
fi

if [ -z "$SSH_AUTH_SOCK" ]; then
    echo "Starting ssh-agent..."
    eval "$(ssh-agent -s)"
fi

echo "Adding key to ssh-agent..."
ssh-add "$KEY_PATH"

PUBLIC_KEY="$(cat "$KEY_PATH.pub")"

if command -v wl-copy >/dev/null 2>&1; then
    printf "%s" "$PUBLIC_KEY" | wl-copy
    echo "Public key copied to clipboard (Wayland)."
elif command -v xclip >/dev/null 2>&1; then
    printf "%s" "$PUBLIC_KEY" | xclip -selection clipboard
    echo "Public key copied to clipboard (X11)."
elif command -v pbcopy >/dev/null 2>&1; then
    printf "%s" "$PUBLIC_KEY" | pbcopy
    echo "Public key copied to clipboard."
else
    echo "Couldn't copy to clipboard automatically."
fi

echo
echo "========== PUBLIC KEY =========="
echo "$PUBLIC_KEY"
echo "================================"
echo

echo "Add this key to GitHub:"
echo "https://github.com/settings/keys"

if command -v xdg-open >/dev/null 2>&1; then
    xdg-open "https://github.com/settings/keys" >/dev/null 2>&1 &
fi

echo
echo "After adding the key, test it with:"
echo "ssh -T git@github.com"
