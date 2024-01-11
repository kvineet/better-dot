{pkgs,mypkgs,config,...}: {
  imports = [
    ./krew
  ];
  home = {
    packages = with pkgs;
    [
      azure-cli
      docker
      kubectl
      kubernetes-helm
      krew
      kubelogin
    ];
    sessionVariables = {
      AZURE_CONFIG_DIR = "${config.xdg.dataHome}/azure";
      DOCKER_CONFIG = "${config.xdg.dataHome}/docker";
      KUBECONFIG = "${config.xdg.dataHome}/kube";
      KUBECACHEDIR = "${config.xdg.dataHome}/kube";
    };
  };
}
