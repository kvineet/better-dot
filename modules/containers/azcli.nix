{
  config,
  lib,
  pkgsStable,
  ...
}:

{
  home = {
    packages = with pkgsStable; [
      (azure-cli.withExtensions [
        azure-cli.extensions.aks-preview
        azure-cli.extensions.fzf

      ])
      # azure-cli
    ];
    sessionVariables = {
      AZURE_CONFIG_DIR = "${config.xdg.stateHome}/azure";
    };
  };
}
