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
  home = {
    packages = with pkgs;
    [ # ...various
      # ibus-with-plugins
      # ibus-engines.table
      # ibus-engines.table-others
      # ibus-engines.typing-booster
      # ibus-engines.m17n
      # ibus-engines.uniemoji
    ];
  };
}
