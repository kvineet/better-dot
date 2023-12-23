{pkgs, config, globals, ...}:
{
  # home.file = {
  #   ".zshenv".source = ./zshenv;    
  # };
  # xdg.configFile = {
  #   # "/zsh/.zshenv".source = ./zshenv;
  #   "zsh/.p10k.zsh".source = ./p10k.zsh;
  #   "zsh/.zprofile".source = ./zprofile;
  #   # "zsh/.zshrc".source = ./zshrc;
  #   "zsh/abbreviations".source = ./abbreviations;
  # };
  imports = [
    ./zsh-abbr/default.nix
  ];
  xdg.dataFile = {
    "zinit/zinit.git".source = builtins.fetchGit {
      url = "https://github.com/zdharma-continuum/zinit.git";
      ref = "main";
      rev = "0ba778ac734e33c960fe08bbd56a351b1b86dcd4";
    };
  };
  home = {
    packages = with pkgs;
    [
      zsh
      zinit
    ];
    sessionVariables = {
      NIX_PATH = "${config.xdg.stateHome}/nix/defexpr/channels";
    };
  };
  programs.zsh ={
    enable = true;
    dotDir = ".config/zsh";
    initExtra = builtins.readFile ./zshrc;
    zsh-abbr.enable = true;
  };
}