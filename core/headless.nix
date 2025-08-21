{ ... }:
{
  imports = [
    ./network.nix
    ./nh.nix
    ./services.nix
    ./virtualization.nix
    ./virt-scripts/default.nix
  ];
}
