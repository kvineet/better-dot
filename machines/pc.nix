# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  mypkgs,
  globals,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    ./common.nix
    ../features/azk8s
    ../features/services
    ../modules/utils/ledger
    ../modules/utils/barrier
    ../modules/devtools
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [ ];
    # Configure your nixpkgs instance
    config = { };
  };
  home.packages = with pkgs; [
    kdePackages.yakuake
  ];
  programs.zsh.zsh-abbr.abbreviations = {
    hm = "home-manager switch --flake ${globals.dirs.dotdir}#pc";
  };
}
