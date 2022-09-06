#!/usr/bin/env sh

BINDIR=$HOME/.local/bin sh -c "$(curl -fsLS git.io/chezmoi)"
echo "PATH=\$PATH:$HOME/.local/bin" >> $HOME/.profile

. $HOME/.profile

chezmoi init
chezmoi apply

