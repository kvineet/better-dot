{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./azcli.nix
  ];
  home = {
    packages = with pkgs; [
      k3s
    ];
  };
}
