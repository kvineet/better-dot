{ pkgs, mypkgs, ... }:
{
  home.packages = [
    pkgs.cloudflared
  ];
  programs.ssh.extraConfig = ''
    Match host ssh.kvineet.com exec "${pkgs.cloudflared}/bin/cloudflared access ssh-gen --hostname %h"
      ProxyCommand ${pkgs.cloudflared}/bin/cloudflared access ssh --hostname %h
      IdentityFile ~/.cloudflared/%h-cf_key
      CertificateFile ~/.cloudflared/%h-cf_key-cert.pub
  '';
}
