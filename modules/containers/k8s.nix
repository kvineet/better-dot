{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./azcli.nix
    ./docker
    ./kubernetes
  ];
}
