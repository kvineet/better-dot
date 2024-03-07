{...}:
{
  programs.zsh.zsh-abbr.abbreviations = {
    "kc" = "kubectl";
    "kccl" = "kubectl_switch_cluster";
    "kcd" = "kubectl describe";
    "kcdd" = "kubectl describe deployment";
    "kcdn" = "kubectl describe node";
    "kcdp" = "kubectl describe pod";
    "kcex" = "kubectl exec -i --tty";
    "kcg" = "kubectl get";
    "kcgd" = "kubectl get deployments";
    "kcgdan" = "kubectl get deployments --all-namespaces";
    "kcgn" = "kubectl get nodes";
    "kcgp" = "kubectl get pods";
    "kcgpan" = "kubectl get pods --all-namespaces";
    "kcl" = "kubectl logs";
    "kclf" = "kubectl logs -f";
    "kcll" = "kubectl logs -l";
    "kcllf" = "kubectl logs -f -l";
    "kcnetshoot" = "kubectl run --generator=run-pod/v1 netshoot-$(date +%s) --rm -i --tty --image nicolaka/netshoot -- /bin/bash";
    "kcns" = "kubectl_switch_namespace";
    "kcpf" = "kubectl port-forward";
    "kctag" = "kubectl get pods -o go-template='{{range .items}} {{range .spec.containers}}{{.image}}{{ \"\\\\n\" }}{{end}}{{end}}\' | sort | uniq | cut -d \":\" -f2";
  };
}