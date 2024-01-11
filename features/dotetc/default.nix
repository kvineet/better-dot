{pkgs,...}:{
  home = {
    packages = with pkgs;
    [ # ...various
      chezmoi
    ];
  };
  # TODO: bootstrap dotfiles
}