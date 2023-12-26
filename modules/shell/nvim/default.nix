{...}:{
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  xdg.configFile.nvim.source = builtins.fetchGit {
    url = "https://github.com/doom-neovim/doom-nvim.git";
    ref = "main";
    rev = "70ceebbbe74f5399d52640c4c7cadb1b4a6b2844";
  }; 
}