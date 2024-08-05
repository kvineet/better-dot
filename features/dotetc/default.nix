{ pkgs, lib, config, ... }: {
  home = {
    packages = with pkgs;
      [
        # ...various
        chezmoi
      ];
    # TODO: bootstrap dot files
    activation.chezmoi = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    DRY_RUN_ARG=""
    if ! [ -z $DRY_RUN_CMD ]; then
       DRY_RUN_ARG="--dry-run"
    fi
    ${lib.getExe pkgs.chezmoi} $VERBOSE_ARG $DRY_RUN_ARG init --apply
    '';
  };
}
