{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs =
    { nixpkgs, home-manager, ... }@inputs:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      globals = {
        username = "kvineet";
        winUser = "vinekulkarni";
        name = "Vineet Kulkarni";
        dotdir = "/home/kvineet/projects/better-dot";
      };
    in
    {
      packages.${system}.default = home-manager.packages.${system}.default;
      homeConfigurations = {
        "kvineet" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit globals;
          };
          modules = [
            ./machines/minimal.nix
          ];
        };
        "msft" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit globals;
          };
          modules = [
            ./machines/msft.nix
          ];
        };
        "pc" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          # targets.genericLinux.enable = true;
          extraSpecialArgs = {
            inherit globals;
          };
          modules = [
            ./machines/pc.nix
          ];
        };
      };
    };
}
