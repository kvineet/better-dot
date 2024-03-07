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
      "c"="clear";
      "cd.."="cd ..";
      "cp"="cp -i";
      
    } // abbr;   
  };
}