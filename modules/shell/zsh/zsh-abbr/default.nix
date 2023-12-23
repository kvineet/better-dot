{...}:
let abbr = builtins.fromTOML(builtins.readFile ./abbreviations);
  gitabbr = builtins.fromTOML(builtins.readFile ./git.abbr);
  kubectlabbr = builtins.fromTOML(builtins.readFile ./kubectl.abbr);
  npmabbr = builtins.fromTOML(builtins.readFile ./npm.abbr);
in {
  imports = [
    ./nix.nix
  ];
  programs.zsh.zsh-abbr = {
    enable = true;
    abbreviations = abbr
                  // gitabbr
                  // kubectlabbr
                  // npmabbr;   
  };
}