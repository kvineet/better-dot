{ pkgs
, ...
}:
let
  callPackage = pkg: pkgs.callPackage pkg;
in
{
  tools = {
    kubectl-ctxns = callPackage ./tools/kubectl-ctxns { };
    kubectl-autons = callPackage ./tools/kubectl-autons { };
  };
}
