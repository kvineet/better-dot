{
  config,
  lib,
  pkgs,
  globals,
  ...
}:

{

  xdg.configFile = {
    "bazarr.container" = {
      target = "${globals.dirs.containerDir}/bazarr.container";
      text = ''
         # torrent-bazarr.container
        [Container]
        ContainerName=bazarr
        EnvironmentFile=env/common.env
        ExposeHostPort=6767/tcp
        Image=lscr.io/linuxserver/bazarr:latest
        Label=in.kvineet.pc1.torrent.service=bazarr
        Network=proxy
        Pod=torrent.pod
        Volume=${config.xdg.configHome}/torrent/bazarr:/config
        Volume=${globals.dirs.webdav}:/webdav

        [Service]
        Restart=always
      '';
    };
    "flaresolverr.container" = {
      target = "${globals.dirs.containerDir}/flaresolverr.container";
      text = ''
        # torrent-flaresolverr.container
        [Container]
        ContainerName=flaresolverr
        Environment=LOG_LEVEL=info
        ExposeHostPort=8191/tcp
        Image=ghcr.io/flaresolverr/flaresolverr:latest
        Label=in.kvineet.pc1.torrent.service=flaresolverr
        Network=proxy
        Pod=torrent.pod
      '';
    };
    "prolarr.container" = {
      target = "${globals.dirs.containerDir}/prolarr.container";
      text = ''
        # torrent-prowlarr.container
        [Container]
        ContainerName=prowlarr
        EnvironmentFile=env/common.env
        ExposeHostPort=9696/tcp
        Image=lscr.io/linuxserver/prowlarr:develop
        Label=in.kvineet.pc1.torrent.service=prowlarr
        Network=proxy
        Pod=torrent.pod
        Volume=${globals.dirs.downloads}/torrents/watch:/downloads
        Volume=${config.xdg.configHome}/torrent/prowlarr:/config

        [Service]
        Restart=always
      '';
    };
    "radarr.container" = {
      target = "${globals.dirs.containerDir}/radarr.container";
      text = ''
        # torrent-radarr.container
        [Container]
        ContainerName=radarr
        EnvironmentFile=env/common.env
        ExposeHostPort=7878/tcp
        Image=lscr.io/linuxserver/radarr:latest
        Label=in.kvineet.pc1.torrent.service=radarr
        Network=proxy
        Pod=torrent.pod
        Volume=${globals.dirs.downloads}/torrents:/downloads
        Volume=${config.xdg.configHome}/torrent/radarr:/config
        Volume=${globals.dirs.webdav}:/webdav

        [Service]
        Restart=always
      '';
    };
    "ranga.container" = {
      target = "${globals.dirs.containerDir}/ranga.container";
      text = ''
        # torrent-ranga.container
        [Container]
        ContainerName=ranga
        EnvironmentFile=env/common.env
        Exec='--conf=/config/ranga.yml' --debug
        Image=registry.gitlab.com/engineerwolf/ranga:latest
        Label=in.kvineet.pc1.torrent.service=ranga
        Network=proxy
        Pod=torrent.pod
        Volume=${config.xdg.configHome}/torrent/ranga:/config

        [Service]
        Restart=always
      '';
    };
    "godler.container" = {
      target = "${globals.dirs.containerDir}/godler.container";
      text = ''
        # torrent-rss-godler.container
        [Container]
        ContainerName=rss-godler
        EnvironmentFile=env/common.env
        Exec='--conf=/config/rss-godler.yml' --deamon-mode --debug
        Image=registry.gitlab.com/engineerwolf/rss-godler:latest
        Label=in.kvineet.pc1.torrent.service=rss-godler
        Network=proxy
        Pod=torrent.pod
        Volume=${globals.dirs.downloads}/torrents:/downloads
        Volume=${config.xdg.configHome}/torrent/rss-godler:/config

        [Service]
        Restart=always
      '';
    };
    "sonarr.container" = {
      target = "${globals.dirs.containerDir}/sonarr.container";
      text = ''
        # torrent-sonarr.container
        [Container]
        ContainerName=sonarr
        EnvironmentFile=env/common.env
        ExposeHostPort=8989/tcp
        Image=lscr.io/linuxserver/sonarr:latest
        Label=in.kvineet.pc1.torrent.service=sonarr
        Network=proxy
        Pod=torrent.pod
        Volume=${globals.dirs.downloads}/torrents:/downloads
        Volume=${config.xdg.configHome}/torrent/sonarr:/config
        Volume=${globals.dirs.webdav}:/webdav

        [Service]
        Restart=always
      '';
    };
    "transmission.container" = {
      target = "${globals.dirs.containerDir}/transmission.container";
      text = ''
        # torrent-transmission.container
        [Container]
        ContainerName=transmission
        EnvironmentFile=env/common.env
        ExposeHostPort=9091/tcp
        Image=lscr.io/linuxserver/transmission:latest
        Label=in.kvineet.pc1.torrent.service=transmission
        Network=proxy
        Pod=torrent.pod
        Volume=${globals.dirs.downloads}/torrents:/downloads
        Volume=${config.xdg.configHome}/torrent/transmission:/config

        [Service]
        Restart=always
      '';
    };
    "torrent.pod" = {
      target = "${globals.dirs.containerDir}/torrent.pod";
      text = ''
        # torrent.pod
        [Pod]
        PublishPort=13370:8191
        PublishPort=13369:9696
        PublishPort=13371:9091
        PublishPort=52267:51413

        [Install]
        WantedBy=default.target
      '';
    };
  };
}
