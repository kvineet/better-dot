{ ... }:
{
  programs.zsh.zsh-abbr.abbreviations = {
    "kc" = "kubecolor";
    "kccl" = "kubecolor_switch_cluster";
    "kcd" = "kubecolor describe";
    "kcdd" = "kubecolor describe deployment";
    "kcdn" = "kubecolor describe node";
    "kcdp" = "kubecolor describe pod";
    "kcex" = "kubecolor exec -i --tty";
    "kcg" = "kubecolor get";
    "kcgd" = "kubecolor get deployments";
    "kcgdan" = "kubecolor get deployments --all-namespaces";
    "kcgn" = "kubecolor get nodes";
    "kcgp" = "kubecolor get pods";
    "kcgpan" = "kubecolor get pods --all-namespaces";
    "kcl" = "kubecolor logs";
    "kclf" = "kubecolor logs -f";
    "kcll" = "kubecolor logs -l";
    "kcllf" = "kubecolor logs -f -l";
    "kcnetshoot" = "kubecolor run --generator=run-pod/v1 netshoot-$(date +%s) --rm -i --tty --image nicolaka/netshoot -- /bin/bash";
    "kcpf" = "kubecolor port-forward";
    "kctag" = "kubecolor get pods -o go-template='{{range .items}} {{range .spec.containers}}{{.image}}{{ \"\\\\n\" }}{{end}}{{end}}\' | sort | uniq | cut -d \":\" -f2";
  };
}
