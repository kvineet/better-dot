{pkgs, config, lib, ...}:{

  xdg.configFile = {
    "nix/nix.conf".text = ''
    experimental-features = nix-command flakes
    '';
  };
  programs.bash = {
    enable = true;
    initExtra = ''
      . "${config.xdg.stateHome}/nix/profiles/profile/etc/profile.d/hm-session-vars.sh"
      . "${config.xdg.stateHome}/nix/profiles/profile/etc/profile.d/nix.sh"
    '';
  };
}
