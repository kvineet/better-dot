{ pkgs, globals, ... }:
let kvnur = (pkgs.callPackage ../../../pkgs { });
in {
  home = {
    packages = [
      kvnur.tools.kubectl-ctxns
      kvnur.tools.kubectl-autons
      pkgs.kubectl-doctor
      pkgs.kubelogin
      pkgs.kubectl-klock
      pkgs.kubectl-ktop
      pkgs.kubectl-neat
      pkgs.kubectl-images
      pkgs.kubectl-explore
      pkgs.kubectl-view-secret
      pkgs.kubecolor
      pkgs.tubekit-unwrapped
    ];
    sessionVariables = {
      KUBECTL_COMMAND = "tubectl";
    };
  };
}
