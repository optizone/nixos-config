{ ... }:
{
  imports = [
    ./bat.nix # better cat command
    ./browser.nix # firefox based browser
    ./btop.nix # resouces monitor
    ./eza/default.nix
    ./fastfetch/default.nix # fetch tool
    ./fish.nix
    ./fzf.nix # fuzzy finder
    ./git.nix # version control
    ./gnome.nix # gnome apps
    ./gtk.nix # gtk theme
    ./hyprland # window manager
    ./packages.nix # other packages
    ./rofi/default.nix # launcher
    ./scripts/scripts.nix # personal scripts
    ./ssh.nix # ssh config
    ./starship.nix # shell prompt
    ./swaylock.nix # lock screen
    ./swayosd.nix # brightness / volume wiget
    ./swaync/swaync.nix # notification deamon
    ./waybar.nix # status bar
    ./waypaper.nix # GUI wallpaper picker
    ./xdg-mimes.nix # xdg config
    ./yazi/default.nix # terminal file manager
    ./zoxide.nix
    ./nemo.nix

    ./zen-browser.nix
    ./kitty.nix
    ./spotify.nix
    ./neovim/default.nix
    ./kanshi.nix
  ];
}
