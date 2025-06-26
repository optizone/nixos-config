{
  pkgs,
  inputs,
  username,
  specialArgs,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs;
    } // specialArgs;
    users.${username} = {
      imports = [
        inputs.nvf.homeManagerModules.default
        ./../home
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
    shell = pkgs.fish;
  };
  # TODO: refactor
  programs.fish.enable = true;
  nix.settings.allowed-users = [ "${username}" ];
}
