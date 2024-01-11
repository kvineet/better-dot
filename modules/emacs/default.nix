{ pkgs, config, lib, ... }:
{
  programs.emacs.enable = true;
  programs.emacs.package = pkgs.emacs29-pgtk;
  services.emacs.enable = true;
  home = {
    packages = with pkgs;
    [ # ...various
      binutils
      (ripgrep.override { withPCRE2 = true; })
      gnutls
      fd
      imagemagick
      zstd
      nodePackages.javascript-typescript-langserver
      sqlite
      editorconfig-core-c
      emacs-all-the-icons-fonts
      emacsPackages.nerd-icons
    ];
    sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
  };
}
