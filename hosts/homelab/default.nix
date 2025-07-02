{ lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../core/headless.nix
    ./user.nix
  ];

  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = null;
      PermitRootLogin = "yes";
    };
  };
}
