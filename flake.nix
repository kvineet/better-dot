{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = {nixpkgs, home-manager, ...}@inputs: 
  let globals = {
    username = "kvineet";
    name = "Vineet Kulkarni";
  };
  in {
    packages.x86_64-linux.default = home-manager.packages.x86_64-linux.default;
 
    homeConfigurations = {
      "msft" = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit globals; };
        modules = [
          ./machines/msft.nix
        ];
      };
    };
  };
}