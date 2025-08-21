{
  inputs,
  username,
  specialArgs,
  shell,
  ...
}:
{
  imports = [ inputs.home-manager-rpi.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    } // specialArgs;
    users.${username} = {
      imports = [
        ../../home/modules/terminal/apps/yazi/default.nix
        ../../home/modules/terminal/apps/fastfetch/default.nix
      ];
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    ignoreShellProgramCheck = true;
    inherit shell;
  };

  nix.settings.allowed-users = [ "${username}" ];
}
