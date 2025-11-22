{ ... }:
{
  programs.winbox = {
    enable = true;
    openFirewall = true;
  };

  imports = [
    ./graphics
    ./services
    ./system
    ./steam.nix
  ];
}
