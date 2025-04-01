{ pkgs, mypkgs, config, ... }: {
  imports = [
    ./docker-abbr.nix
  ];
  home = {
    packages = with pkgs;
      [
        docker
        docker-compose
      ];
    sessionVariables = {
      DOCKER_CONFIG = "${config.xdg.dataHome}/docker";
    };
  };
}
