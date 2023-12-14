{
  description = "My Home Manager flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    defaultPackage.x86_64-linux = home-manager.defaultPackage.x86_64-linux;
    defaultPackage.x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
 
    homeConfigurations = {
      "kvineet" = inputs.home-manager.lib.homeManagerConfiguration {
        system = "x86_64-linux"; 
        homeDirectory = "/home/kvineet";
        username = "kvineet"; 
        configuration.imports = [ ./home.nix ];
      };
    };
  };
}
