{
  config,
  lib,
  pkgs,
  ...
}:

{
  home = {
    packages = with pkgs; [ azure-cli ];
    sessionVariables = {
      AZURE_CONFIG_DIR = "${config.xdg.stateHome}/azure";
    };
  };
}
