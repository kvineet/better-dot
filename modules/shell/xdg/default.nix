{ config, ... }:
{
  home.sessionVariables = {
    ASPELL_CONF = "per-conf ${config.xdg.configHome}/aspell/aspell.conf; personal ${config.xdg.configHome}/aspell/en.pws; repl ${config.xdg.configHome}/aspell/en.prepl";
    CARGO_HOME = "${config.xdg.configHome}/cargo";
    GTK2_RC_FILES = "\"${config.xdg.configHome}/gtk-2.0/gtkrc\":\"${config.xdg.configHome}/gtk-2.0/gtkrc.mine\"";
    PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python";
    PYTHON_HISTORY = "${config.xdg.stateHome}/python/history";
    PYTHONUSERBASE = "${config.xdg.dataHome}/python";
    WGETRC = "${config.xdg.configHome}/wgetrc";
    XINITRC = "${config.xdg.configHome}/X11/xinitrc";
    XSERVERRC = "${config.xdg.configHome}/X11/xserverrc";
  };
  xdg.configFile.wgetrc = {
    target = "wgetrc";
    text = ''
      hsts-file = "${config.xdg.cacheHome}/wget-hsts"
    '';
  };
}
