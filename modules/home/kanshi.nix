{ pkgs, ... }:
{
  services.kanshi = {
    enable = true;
    settings = [
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
          }
        ];
      }
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "disable";
          }
          {
            criteria = "DP-7";
            status = "enable";
          }
          {
            criteria = "DP-8";
            status = "enable";
          }
        ];
      }
    ];
  };
}
