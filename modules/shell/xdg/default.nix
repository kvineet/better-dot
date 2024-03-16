{ config, ... }:
{
  home.sessionVariables = {
    CARGO_HOME = "${config.xdg.configHome}/cargo";
    PYTHON_HISTORY = "${config.xdg.stateHome}/python/history";
    PYTHONPYCACHEPREFIX = "${config.xdg.cacheHome}/python/history";
  };
}
