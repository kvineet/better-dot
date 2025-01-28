{
  config,
  lib,
  pkgs,
  globals,
  ...
}:

{
  xdg.configFile = {
    "shoko.env" = {
      target = "${globals.dirs.containerDir}/env/shoko.env";
      text = ''
        HOME=/tmp
        COMPlus_EnableDiagnostics=0
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
    "shoko.pod" = {
      target = "${globals.dirs.containerDir}/shoko.pod";
      text = ''
        # shoko.pod
        [Pod]
        PublishPort=13377:8111'';
    };
    "shoko.container" = {
      target = "${globals.dirs.containerDir}/shoko.container";
      text = ''
        # shoko-shoko.container
        [Container]
        ContainerName=shoko
        EnvironmentFile=env/common.env
        EnvironmentFile=env/shoko.env
        ExposeHostPort=8111/tcp
        Image=docker.io/shokoanime/server:latest
        Label=in.kvineet.pc1.shoko.service=shoko
        Network=proxy
        Pod=shoko.pod
        Volume=${globals.dirs.blk}/Shoko:/home/shoko/.shoko
        Volume=${globals.dirs.webdav}:/data/content
        Volume=${globals.dirs.downloads}/torrents:/data/import
        WorkingDir=/home/shoko/

        [Service]
        Restart=always
      '';
    };
  };
}
