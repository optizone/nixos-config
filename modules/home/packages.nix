{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      ## CLI utility
      dust
      fd # find replacement
      jq # JSON processor
      ripgrep
      killall
      libnotify
      man-pages # extra man pages
      nitch # systhem fetch util
      nixd # nix lsp
      nixfmt-rfc-style # nix formatter
      openssl
      pamixer # pulseaudio command line mixer
      playerctl # controller for media players
      poweralertd
      programmer-calculator
      shfmt # bash formatter
      swappy # snapshot editing tool
      unzip
      valgrind # c memory analyzer
      wl-clipboard # clipboard utils for wayland (wl-copy, wl-paste)
      wget
      xdg-utils
      mpv
      file
      netcat

      ## GUI Apps
      gimp
      libreoffice
      pavucontrol # pulseaudio volume controle (GUI)
      gnome-calculator # calculator
      wineWowPackages.wayland
      oculante
      telegram-desktop

      # todo: package
      thunderbird
    ]
  );
}
