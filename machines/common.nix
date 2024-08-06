# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  globals,
  ...
}:
{
  # You can import other home-manager modules here
  imports = [
    ../features/dotetc
    ../features/nix
    ../modules/shell
    ../modules/emacs
    ../modules/cloud/cloudflare
    ../modules/cloud/syncthing
    ../modules/cloud/bitwarden
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

  # Enable home-manager
  programs.home-manager.enable = true;
  home = {
    stateVersion = "23.05";
    packages = with pkgs; [
      fzf
      jq
      yq-go
      taskwarrior
      taskwarrior-tui
      go
      gh
    ];
  };
  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
  programs.git.includes = [
    {
      condition = "hasconfig:remote.*.url:git@*.com:kvineet/**";
      contentSuffix = "kvineet.gitconfig";
      contents = {
        user = {
          email = "vineet.kulkarni8@gmail.com";
          name = "Vineet Kulkarni";
        };
        url = {
          "ssh://git@github.com/" = {
            insteadOf = "https://github.com/";
          };
          "ssh://git@gitlab.com/" = {
            insteadOf = "https://gitlab.com/";
          };
        };
      };
    }
    {
      condition = "hasconfig:remote.*.url:git@*.com:engineerwolf/**";
      contentSuffix = "engineerwolf.gitconfig";
      contents = {
        user = {
          email = "engineerwolf.reddit@gmail.com";
          name = "Engineerwolf";
        };
        url = {
          "ssh://git@github.com/" = {
            insteadOf = "https://github.com/";
          };
          "ssh://git@gitlab.com/" = {
            insteadOf = "https://gitlab.com/";
          };
        };
      };
    }
  ];

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
}
