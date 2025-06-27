{ ... }:
{
  imports = [
    ../laptop-common/default.nix
    ./hardware-configuration.nix
    ./../../modules/core
  ];
}
