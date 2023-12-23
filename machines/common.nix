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
    ../modules/nix
    ../modules/shell/zsh
    ../modules/shell/tmux
    ../modules/cloud/cloudflare
    ../modules/cloud/syncthing
    ../modules/fonts
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "${globals.username}";
    homeDirectory = "/home/${globals.username}";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;
  programs.neovim.defaultEditor = true;
  home = {
    stateVersion = "23.05";
    packages = with pkgs;
    [
      git
      lsd
      neovim
      fzf
      jq
      yq-go
      rnix-lsp
      docker-compose
      direnv
      taskwarrior
      taskwarrior-tui
      go
    ];
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}