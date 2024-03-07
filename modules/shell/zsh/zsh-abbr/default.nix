{...}:
let abbr = builtins.fromTOML(builtins.readFile ./abbreviations);
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
      "600"="chmod 600";
      "644"="chmod 644";
      "744"="chmod 744";
      "x"="chmod +x";
      "c"="clear";
      "cd.."="cd ..";
      "cp"="cp -i";
      
    } // abbr;   
  };
}