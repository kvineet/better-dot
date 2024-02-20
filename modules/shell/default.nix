{pkgs,...}:{
  imports = [
    ./zsh
    ./git
  ];

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  home = {
    packages = with pkgs;
    [ 
      shellcheck
      up
    ];
  };
}
