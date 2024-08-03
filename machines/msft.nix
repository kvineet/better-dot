# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, lib
, config
, pkgs
, mypkgs
, globals
, ...
}: {
  # You can import other home-manager modules here
  imports = [
    ./common.nix
    ../features/wsl
    ../features/azk8s
    ../modules/utils/ledger
    ../modules/utils/sql
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
    ];
    # Configure your nixpkgs instance
    config = { };
  };
  programs.zsh.zsh-abbr.abbreviations = {
    hm = "home-manager switch --flake ${globals.dotdir}#msft";
  };

  programs.git.includes =
    [
      {
        condition = "hasconfig:remote.*.url:https://msazuredev@dev.azure.com/**";
        contentSuffix = "msft.gitconfig";
        contents = {
          user = {
            email = "vinekulkarni@microsoft.com";
            name = "Vineet  Kulkarni";
          };
          credential = {
            "https://dev.azure.com".useHttpPath = true;
            helper = "${pkgs.git-credential-manager}/bin/git-credential-manager";
            credentialStore = "gpg";
            cacheOptions = "--timeout 300";
          };
        };
      }
    ];
}
