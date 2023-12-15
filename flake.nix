{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {nixpkgs, home-manager, ...}@inputs: 
  let lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    globals = {
      username = "kvineet";
      name = "Vineet Kulkarni";
    };
  in {
    packages.${system}.default = home-manager.packages.${system}.default;
    homeConfigurations = {
      "msft" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit globals; };
        modules = [
          ./machines/msft.nix
        ];
      };
    };
  };
}