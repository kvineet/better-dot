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
}: {
  # You can import other home-manager modules here
  imports = [
    ./common.nix
    ../features/wsl
    ../features/azk8s
    ../modules/emacs
    ../modules/utils/ledger
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
    ];
    # Configure your nixpkgs instance
    config = {
    };
  };
  programs.zsh.zsh-abbr.abbreviations = {
    msft = "home-manager switch --flake ${globals.dotdir}#msft";
  };
  programs.git.includes =
    [
      {
        condition = "hasconfig:remote.*.url:git@ssh.dev.azure.com:v3/**";
        contentSuffix = "msft.gitconfig";
        contents = {
          user = {
            email = "vinekulkarni@microsoft.com";
            name = "Vineet Kulkarni";
          };
        };
      }
    ];
}
