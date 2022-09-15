#!/usr/bin/env sh

BINDIR=$HOME/.local/bin PATH=$PATH:$BINDIR sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply
