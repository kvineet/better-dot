{ pkgs, config, lib, ... }:
{
  programs.emacs.enable = true;
  programs.emacs.package = pkgs.emacs29;
  services.emacs.enable = true;
  home = {
    packages = with pkgs;
      [
        # ...various
        binutils
        (ripgrep.override { withPCRE2 = true; })
        gnutls
        fd
        imagemagick
        zstd
        nodePackages.javascript-typescript-langserver
        sqlite
        editorconfig-core-c
        emacsPackages.nerd-icons
        emacs-all-the-icons-fonts
        nerdfonts
        auctex
        texliveFull
        math-preview
        emacsPackages.tree-sitter
        tree-sitter-grammars.tree-sitter-go
        # tree-sitter-grammars.tree-sitter-nix
        # tree-sitter-grammars.tree-sitter-ledger
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
}
