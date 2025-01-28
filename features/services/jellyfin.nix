{
  config,
  lib,
  pkgs,
  globals,
  ...
}:

{
  xdg.configFile = {
    "jellyfin.env" = {
      target = "${globals.dirs.containerDir}/env/jellyfin.env";
      text = ''
        HOME=/tmp
        AMDGPU_IDS=/share/libdrm/amdgpu.ids
        FONTCONFIG_PATH=/etc/fonts
        LD_LIBRARY_PATH=/lib:/system
        LIBVA_DRIVERS_PATH=/lib/dri
        OCL_ICD_VENDORS=/etc/OpenCL/vendors
        PCI_IDS_PATH=/share/hwdata/pci.ids
        SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
        NVIDIA_VISIBLE_DEVICES=all
        NVIDIA_DRIVER_CAPABILITIES=compute,utility
      '';
    };
    "jellyfin.pod" = {
      target = "${globals.dirs.containerDir}/jellyfin.pod";
      text = ''
        # jellyfin.pod
        [Pod]
        PublishPort=13385:8096
      '';
    };
    "jellyfin.container" = {
      target = "${globals.dirs.containerDir}/jellyfin.container";
      text = ''
        # jellyfin-jellyfin.container
        [Container]
        ContainerName=jellyfin
        EnvironmentFile=env/jellyfin.env
        EnvironmentFile=env/common.env
        ExposeHostPort=8096/tcp
        ExposeHostPort=7359/udp
        ExposeHostPort=1900/udp
        Image=docker.io/linuxserver/jellyfin:latest
        Label=in.kvineet.pc1.torrent.service=jellyfin
        Network=proxy
        Pod=jellyfin.pod
        Volume=${globals.dirs.blk}/Jellyfin:/config
        Volume=${globals.dirs.webdav}:/data/content

        [Service]
        Restart=always
      '';
    };
  };
}
