#!/usr/bin/env sh

if command -v pacman &> /dev/null
then
    printf "pacman detected. Assuming Arch based system."
    sudo pacman -S which git zsh --noconfirm
elif command -v apt &> /dev/null
then
    printf "apt detected. Assuming Ubuntu based system."
    sudo apt install -y which git zsh
elif command -v dnf &> /dev/null
then
     printf "dnf detected. Assuming Fedora."
     sudo dnf install -y which git zsh
else
    printf "No known package manager detected. Ensure which, git and zsh are installed"
fi

BINDIR=$HOME/.local/bin sh -c "$(curl -fsLS git.io/chezmoi)"
echo "PATH=\$PATH:$HOME/.local/bin" >> $HOME/.profile

. $HOME/.profile

chezmoi init
chezmoi apply --no-tty
