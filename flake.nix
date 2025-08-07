{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    krewfile = {
      url = "github:brumhard/krewfile";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl.url = "github:nix-community/nixGL";
  };
  outputs =
    {
      nixpkgs,
      nixpkgs-stable,
      home-manager,
      krewfile,
      nixgl,
      ...
    }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgsStable = import nixpkgs-stable { inherit system; }; # Unstable packages
      overlays = [ nixgl.overlay ];
      globals = {
        username = "kvineet";
        winUser = "vinekulkarni";
        name = "Vineet Kulkarni";
        dirs = {
          downloads = "/home/${globals.username}/Downloads";
          webdav = "/srv/webDav";
          blk = "/media/HandPortal";
          dotdir = "/home/${globals.username}/projects/better-dot";
          containerDir = "/home/${globals.username}/.config/containers/systemd";
        };
      };
    in
    {
      packages.${system}.default = home-manager.packages.${system}.default;
      homeConfigurations = {
        "kvineet" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit globals;
            inherit pkgsStable;
          };
          modules = [
            ./machines/minimal.nix
          ];
        };
        "msft" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit globals;
            inherit pkgsStable;
          };
          modules = [
            ./machines/msft.nix
            inputs.krewfile.homeManagerModules.krewfile
          ];
        };
        "pc" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # targets.genericLinux.enable = true;
          extraSpecialArgs = {
            inherit globals;
            inherit pkgsStable;
          };
          modules = [
            ./machines/pc.nix
          ];
        };
      };
    };
}
