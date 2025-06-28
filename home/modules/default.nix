{ ... }:
{
  imports = [
    ./browsers/firefox.nix
    ./browsers/zen-browser.nix
    ./browsers/google-chrome.nix

    ./desktops/default.nix

    ./gui-apps/obsidian.nix
    ./gui-apps/file-managers/nemo.nix
    ./gui-apps/images/gimp.nix
    ./gui-apps/images/inkscape.nix
    ./gui-apps/images/oculante.nix
    ./gui-apps/multimedia/mpv.nix
    ./gui-apps/multimedia/spotify.nix
    ./gui-apps/office/libreoffice.nix
    ./gui-apps/social/telegram.nix

    ./scripts

    ./shells/fish.nix

    ./terminal/apps
    ./terminal/emulators/kitty.nix

    ./git.nix
    ./kanshi.nix
    ./packages.nix
    ./ssh.nix
    ./waypaper.nix
    ./xdg-mimes.nix
  ];
}
