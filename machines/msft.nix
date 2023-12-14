# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  globals,
  ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./common.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
    ];
    # Configure your nixpkgs instance
    config = {
    };
  };
  home.packages = [
    pkgs.azure-cli
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.krew
    pkgs.kubelogin
  ];
}