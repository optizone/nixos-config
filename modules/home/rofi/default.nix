{ pkgs, ... }:
{
  home.packages = with pkgs; [ rofi-wayland ];

  xdg.configFile."rofi/gruvbox-dark-soft.rasi".source = ./gruvbox-dark-soft.rasi;
  xdg.configFile."rofi/config.rasi".text = ''@theme "gruvbox-dark-soft"'';
}
