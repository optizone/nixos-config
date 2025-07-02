{ ... }:
{
  # /etc/nixos/configuration.nix
  networking.defaultGateway = "192.168.68.1";
  networking.bridges.br0.interfaces = [ "enp0s13f0u3u1" ];
  networking.interfaces.br0 = {
    useDHCP = false;
    ipv4.addresses = [
      {
        address = "192.168.68.3";
        prefixLength = 22;
      }
    ];
  };
}
