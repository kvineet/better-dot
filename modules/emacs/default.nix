{ pkgs, config, lib, ... }:
{
  programs.emacs.enable = true;
  programs.emacs.package = pkgs.emacs29-pgtk;
  home = {
    packages = with pkgs;
    [ # ...various
      emacsPackages.doom
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
    ];
    sessionPath = [ "${config.xdg.configHome}/emacs/bin" ];
    sessionVariables = {
      DOOMDIR = "${config.xdg.configHome}/doom-config";
      DOOMLOCALDIR = "${config.xdg.configHome}/doom-local";
    };
  };

  xdg = {
    enable = true;
    configFile = {
      "doom-config/config.el".text = "…";
      "doom-config/init.el".text = "…";
      "doom-config/packages.el".text = "…";
      "emacs" = {
        source = builtins.fetchGit {
          url = "https://github.com/hlissner/doom-emacs";
          ref = "master";
          rev = "03d692f129633e3bf0bd100d91b3ebf3f77db6d1";
          };
        onChange = "${pkgs.writeShellScript "doom-change" ''
          export DOOMDIR="${config.home.sessionVariables.DOOMDIR}"
          export DOOMLOCALDIR="${config.home.sessionVariables.DOOMLOCALDIR}"
          if [ ! -d "$DOOMLOCALDIR" ]; then
            ${config.xdg.configHome}/emacs/bin/doom -y install
          else
            ${config.xdg.configHome}/emacs/bin/doom -y sync -u
          fi
        ''}";
      };
    };
  };
}