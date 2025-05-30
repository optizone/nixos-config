{ pkgs, host, ... }:
{
  networking = {
    hostName = "${host}";
    networkmanager.enable = true;
    nameservers = [
      "83.243.64.1"
      "83.243.65.2"
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
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
