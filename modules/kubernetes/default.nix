{pkgs,mypkgs,...}: {
  imports = [
    ./krew
  ];
  home.packages = [
    pkgs.azure-cli
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.krew
    pkgs.kubelogin
  ];
}