#!/bin/bash

while getopts "d" option; do
    case "$option" in
    d)
        # create & start
        ssh-keygen -t ed25519 -C "your_email@example.com"
        eval "$(ssh-agent -s)"

        # add key
        ssh-add -l
        ;;
    esac
done

# print key
echo "your key:"
cat ~/.ssh/id_ed25519.pub
read -p "add this to your github, and when your done press enter"

# test connection
ssh -T git@github.com
