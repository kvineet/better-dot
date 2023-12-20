#!/bin/bash

sudo mkdir /etc/nix
# write nix.conf
sudo /bin/cat <<EOF > /etc/nix/nix.conf
build-users-group = nixbld
extra-experimental-features = nix-command flakes
use-xdg-base-directories = true
EOF

# install nix
bash <(curl -L https://nixos.org/nix/install) --daemon

echo ". $HOME/.nix-profile/etc/profile.d/nix.sh" >> ~/.profile
. .profile

# add home manager
nix-channel --add https://github.com/rycee/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
