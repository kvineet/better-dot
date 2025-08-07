{ ... }:
{
  programs.zsh.zsh-abbr.abbreviations = {
    "kc" = "kubectl";
    "kcd" = "kubectl describe";
    "kcex" = "kubectl exec -i --tty";
    "nslog" = "kubectl logs -f ns%%";
    "ntslog" = "kubectl logs -f nts%%";
    "adlog" = "kubectl logs -f +admin admin%%";
    "kcpf" = "kubectl port-forward";
    "kctag" = "kubectl get pods -o yaml | yq '.items[].status.containerStatuses[].image' | sort | uniq";
  };
  home.shellAliases = {
      "kubectl"  = "kubecolor";
  };
}
