{pkgs,mypkgs,config,...}: {
  imports = [
    ./krew
  ];
  home = {
    packages = with pkgs;
    [
      azure-cli
      kubectl
      kubernetes-helm
      krew
      kubelogin
    ];
    sessionVariables = {
      AZURE_CONFIG_DIR = "${config.xdg.dataHome}/azure";
    };
  };
}