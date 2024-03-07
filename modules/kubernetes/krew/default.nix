{ pkgs, globals, ... }:
let kubectl-ctxns = (pkgs.callPackage ../../../pkgs/tools/kubectl-ctxns { });
in
{
  home = {
    packages = [
      kubectl-ctxns
      pkgs.kubectl-doctor
      pkgs.kubelogin
      pkgs.kubectl-klock
      pkgs.kubectl-ktop
      pkgs.kubectl-neat
      pkgs.kubectl-images
      pkgs.kubectl-explore
      pkgs.kubecolor
      pkgs.tubekit-unwrapped
    ];
  };
}
