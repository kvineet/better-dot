{ pkgs, config, lib, ... }: {

  home.packages = with pkgs;
    [
      # rnix-lsp
    ];
  xdg.configFile = {
    "nix/nix.conf".text = ''
      experimental-features = nix-command flakes
    '';
  };
  programs.direnv =
    {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  programs.bash = {
    enable = false;
    initExtra = ''
      . "${config.xdg.stateHome}/nix/profiles/profile/etc/profile.d/hm-session-vars.sh"
    '';
  };
}
