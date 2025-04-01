{
  config,
  lib,
  pkgs,
  globals,
  ...
}:
{
  imports = [
    ./cloudflare-tunnel.nix
    ./jellyfin.nix
    ./shoko.nix
    ./torrent.nix
  ];
  xdg.configFile = {
    "common.env" = {
      target = "${globals.dirs.containerDir}/env/common.env";
      text = ''
        TZ="Asia/Kolkata"
        UID=1
        GID=1
        GIDLIST=0
        PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
        HOME=/root
        LANGUAGE=en_US.UTF-8
        LANG=en_US.UTF-8
        TERM=xterm
        XDG_CONFIG_HOME=/config/xdg
      '';
    };
    "proxy.network" = {
      target = "${globals.dirs.containerDir}/proxy.network";
      text = ''
        # proxy.network
        [Network]
        Driver=bridge
        Gateway=10.89.0.1
        IPAMDriver=host-local
        PodmanArgs=--interface-name podman1
        Subnet=10.89.0.0/24
      '';
    };
  };
}
