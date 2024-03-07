{
  description = "My personal NUR repository";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs =
    { self
    , nixpkgs
    , systems
    ,
    }:
    let
      eachSystem = nixpkgs.lib.genAttrs (import systems);
      pkgs = eachSystem (system: (nixpkgs.legacyPackages.${system}.extend));
      packagesFn = pkgs:
        import ./default.nix {
          inherit (pkgs) lib;
        };
    in
    {
      packages = eachSystem (system: packagesFn pkgs.${system});
      overlays.default = final: prev: packagesFn prev;
    };
}
