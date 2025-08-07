{ pkgs, mypkgs, config, lib, ... }: {
  imports = [
    ./kubectl-abbr.nix
  ];
  home = {
    packages = with pkgs;
      [
        kubectl
        kubernetes-helm
        kustomize
        kubelogin
        kubecolor
        tubekit-unwrapped
      ];
    sessionVariables = {
      KUBECONFIG = "${config.xdg.dataHome}/kube";
      KUBECACHEDIR = "${config.xdg.cacheHome}/kube";
      KUBECTL_COMMAND = "tubectl";
    };
  };
  programs.krewfile = {
    enable = true;
    upgrade = true;
    krewPackage = pkgs.krew;
    krewRoot = "${config.xdg.stateHome}/krew";
    # indexes = { foo = "https://github.com/nilic/kubectl-netshoot.git"; };
    plugins = [
      # "foo/some-package"
      "ctx"
      "clog"
      "autons"
      "change-ns"
      "doctor"
      "klock"
      "ktop"
      "neat"
      "images"
      "explore"
      "modify-secret"
      "neat"
      "tunnel"
      "who-can"
      "oidc-login"
      "pv-migrate"
      "stern"
    ];
  };
}
