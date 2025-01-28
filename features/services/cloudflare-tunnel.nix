{
  config,
  lib,
  pkgs,
  globals,
  ...
}:
{
  xdg.configFile = {
    "tunnel.pod" = {
      target = "${globals.dirs.containerDir}/tunnel.pod";
      text = ''
        # tunnel.pod
        [Pod]
      '';
    };
    "tunnel.container" = {
      target = "${globals.dirs.containerDir}/tunnel.container";
      text = ''
        # tunnel-tunnel.container
        [Container]
        ContainerName=tunnel
        EnvironmentFile=env/tunnel.env
        Exec=tunnel --no-autoupdate run
        Image=docker.io/cloudflare/cloudflared:latest
        Network=proxy
        Pod=tunnel.pod

        [Service]
        Restart=always

        [Install]
        WantedBy=default.target
      '';
    };
  };
}
