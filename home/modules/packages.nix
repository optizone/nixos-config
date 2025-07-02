{ pkgs, ... }:
{
  # TODO: move to modules
  home.packages = with pkgs; [
    libnotify
    mpv
    xdg-utils

    pavucontrol # pulseaudio volume controle (GUI)
    gnome-calculator # calculator
    wineWowPackages.wayland

    # todo: package
    thunderbird
  ];
}
