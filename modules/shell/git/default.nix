{pkgs, config, globals, ...}:
{
  imports = [
    ./git-abbr.nix
  ];
  programs.git.enable = true;
  programs.git.delta.enable = true;
}
