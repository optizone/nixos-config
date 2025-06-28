{
  inputs,
  username,
  specialArgs,
  shell,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    backupFileExtension = "bak";
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    } // specialArgs;
    users.${username} = {
      imports = [
        inputs.nvf.homeManagerModules.default
        ../../home/modules
      ];
      home.username = "${username}";
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
