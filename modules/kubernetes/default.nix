{ pkgs, mypkgs, config, ... }: {
  imports = [
    ./krew
    ./kubectl-abbr.nix
  ];
  home = {
    packages = with pkgs;
      [
        kubectl
        kubernetes-helm
        krew
        kubelogin
      ];
    sessionVariables = {
      KUBECONFIG = "${config.xdg.dataHome}/kube";
      KUBECACHEDIR = "${config.xdg.cacheHome}/kube";
    };
  };
}
