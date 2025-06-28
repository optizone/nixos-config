{ pkgs, ... }:
{
  # TODO: move to modules
  home.packages = with pkgs; [
    ## CLI utility
    jq # JSON processor
    ripgrep
    killall
    libnotify
    man-pages # extra man pages
    nixfmt-rfc-style # nix formatter
    pamixer # pulseaudio command line mixer
    poweralertd
    shfmt # bash formatter
    unzip
    wget
    xdg-utils
    mpv
    file
    netcat

    ## GUI Apps
    pavucontrol # pulseaudio volume controle (GUI)
    gnome-calculator # calculator
    wineWowPackages.wayland

    # todo: package
    thunderbird
  ];
}
