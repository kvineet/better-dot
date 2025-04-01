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
    ../features/wsl
    ../modules/containers/k8s.nix
    ../modules/utils/ledger
    ../modules/utils/sql
    ../modules/devtools
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [ ];
    # Configure your nixpkgs instance
    config = { };
  };
  programs.zsh.zsh-abbr.abbreviations = {
    hm = "home-manager switch --flake ${globals.dirs.dotdir}#msft";
  };

  programs.git.includes = [
    {
      condition = "hasconfig:remote.*.url:https://msazuredev@dev.azure.com/**";
      contentSuffix = "msft.gitconfig";
      contents = {
        core = {
          autocrlf = true;
        };
        user = {
          email = "vinekulkarni@microsoft.com";
          name = "Vineet  Kulkarni";
        };
        credential = {
          "https://dev.azure.com".useHttpPath = true;
          helper = "/mnt/c/Program\\ Files/Git/mingw64/bin/git-credential-manager.exe";
        };
      };
    }
  ];
}
