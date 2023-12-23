#!/usr/bin/env sh

export XDG_CONFIG_HOME=$HOME/.config 
export XDG_STATE_HOME=$HOME/.local/state
export XDG_DATA_HOME=$HOME/.local/share
export NIX_PATH=$XDG_STATE_HOME/nix/defexpr/channels
sh <(curl -L https://nixos.org/nix/install) --daemon

git clone git@kvineet.github.com:kvineet/better-dot.git

DOT_DIR=~/projects/better-dot
nix run $DOT_DIR switch \
    --extra-experimental-features nix-command \
    --extra-experimental-features flakes \
    -- \
    --flake $DOT_DIR.#msft \
    switch \
    --extra-experimental-features nix-command \
    --extra-experimental-features flakes

which zsh | sudo tee -a /etc/shells
chsh -s $(which zsh)
