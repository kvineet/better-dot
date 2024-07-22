{ pkgs, config, ... }:
{
  # You can import other home-manager modules here
  imports = [
    ../../modules/docker
    ../../modules/kubernetes
  ];
  home = {
    packages = with pkgs;
      [
        azure-cli
      ];
    sessionVariables = {
      AZURE_CONFIG_DIR = "${config.xdg.dataHome}/pass";
    };
  };
}
