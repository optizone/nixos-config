{ username, ... }:
{
  imports = [
    ../../core/headless.nix
    ./user.nix
    ./filesystem.nix
    # ./hardware-configuration.nix
    # ./disko.nix
  ];

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN7UlGP17xXM1oxxckQWWh8Yphx7arOgSk9dxNBbrtQy"
  ];

  users.users.${username}.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN7UlGP17xXM1oxxckQWWh8Yphx7arOgSk9dxNBbrtQy"
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
