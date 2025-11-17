{ ... }:
{
  services.nfs.server.enable = true;

  # TODO: !!!CRITICAL!!! add some security please )):
  services.nfs.server.exports = ''
    /export             192.168.68.2(rw,fsid=0,no_subtree_check)
    /export/backups     192.168.68.2(rw,nohide,insecure,no_subtree_check)
    /export/disk-images 192.168.68.2(rw,nohide,insecure,no_subtree_check)
    /export/media       192.168.68.2(rw,nohide,insecure,no_subtree_check)
  '';

  networking.firewall.allowedTCPPorts = [
    111
    2049
  ];
  networking.firewall.allowedUDPPorts = [
    111
    2049
  ];
}
