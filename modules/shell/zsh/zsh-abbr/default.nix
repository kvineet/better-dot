{...}:
let abbr = builtins.fromTOML(builtins.readFile ./abbreviations);
  gitabbr = builtins.fromTOML(builtins.readFile ./git.abbr);
  kubectlabbr = builtins.fromTOML(builtins.readFile ./kubectl.abbr);
  npmabbr = builtins.fromTOML(builtins.readFile ./npm.abbr);
in {
  programs.zsh.zsh-abbr = {
    enable = true;
    abbreviations = {
      "...." = "cd ../../..";
      "-"="cd -";
      ".."="cd ..";
      "..."="cd ../..";
      "_"="sudo";
      "400"="chmod 400";
      "c"="clear";
      "cd.."="cd ..";
      "cp"="cp -i";
      
    } // abbr
      // gitabbr
      // kubectlabbr
      // npmabbr;   
  };
}