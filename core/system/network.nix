{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;

    firewall = {
      enable = false;

      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        57621
      ];

      allowedUDPPorts = [
        59010
        59011
        5353
      ];
    };
  };

  environment.systemPackages = with pkgs; [ networkmanagerapplet ];
}
