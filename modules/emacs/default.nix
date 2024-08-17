{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ./chemacs2.nix
    ./doom.nix
  ];
  programs.emacs.enable = true;
  programs.emacs.package = pkgs.emacs29;
  services.emacs.enable = true;
  home = {
    packages = with pkgs; [
      # ...various
      (ripgrep.override { withPCRE2 = true; })
      aspell
      aspellDicts.en
      aspellDicts.en-computers
      aspellDicts.en-science
      aspellDicts.hi
      aspellDicts.mr
      auctex
      binutils
      cargo
      csharpier
      dockfmt
      editorconfig-core-c
      emacs-all-the-icons-fonts
      emacsPackages.nerd-icons
      fd
      gnutls
      gnuplot
      gomodifytags
      gopls
      gore
      gotests
      gotools
      imagemagick
      maim
      math-preview
      nerdfonts
      rust-analyzer
      rustc
      shfmt
      sqlite
      texliveFull
      xclip
      zstd
    ];
    sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];

  };
  programs.zsh.zsh-abbr.abbreviations = {
    "e" = "emacsclient -n";
    "E" = "SUDO_EDITOR=emacsclient sudo -e";
    "ed" = "emacs --daemon";
    "em" = "emacs";
    "en" = "emacs -nw";
    "et" = "emacsclient -t";
  };
  xdg.dataFile = {
    "applications/org-protocol.desktop".text = ''
      [Desktop Entry]
      Name=org-protocol
      Comment=Intercept calls from emacsclient to trigger custom actions
      Categories=Other;
      Keywords=org-protocol;
      Icon=emacs
      Type=Application
      Exec=emacsclient %u
      Terminal=false
      StartupWMClass=Emacs
      MimeType=x-scheme-handler/org-protocol;
    '';
  };
}
