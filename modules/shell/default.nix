{pkgs,...}:{
  imports = [
    ./zsh
    ./git
    ./lsd
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
