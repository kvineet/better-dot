{
  pkgs,
  config,
  globals,
  ...
}:
{
  imports = [ ./zsh-abbr/default.nix ];
  xdg.dataFile = {
    "zinit/zinit.git".source = builtins.fetchGit {
      url = "https://github.com/zdharma-continuum/zinit.git";
      ref = "main";
      rev = "d05a5301150909d8b386ebb974e1d1634740d65d";
    };
  };
  xdg.configFile.p10k = {
    target = "zsh/.p10k.zsh";
    source = ./p10k.zsh;
  };
  home = {
    packages = with pkgs; [
      zsh
      zinit
    ];
    sessionVariables = {
      NIX_PATH = "${config.xdg.stateHome}/nix/defexpr/channels";
    };
  };
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./zshrc;
    envExtra = ''
      # Environment variables
      . "${config.xdg.stateHome}/nix/profile/etc/profile.d/hm-session-vars.sh"
    '';
    zsh-abbr.enable = true;
  };
}
