{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hypr-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };

    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprgraphics.follows = "hyprland/hyprgraphics";
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };

    nur.url = "github:nix-community/NUR";
    nix-gaming.url = "github:fufexan/nix-gaming";

    yazi-plugins = {
      url = "github:yazi-rs/plugins";
      flake = false;
    };

    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      self,
      nix-index-database,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      font = "JetBrainsMono Nerd Font";
      fontMono = "${font} Mono";
      shell = pkgs.fish;

      gitUsername = "optizone";
      gitEmail = "ilya.kek.lol.orbidol@gmail.com";

      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
    {
      nixosConfigurations = {
        thinkpad = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/thinkpad
            nix-index-database.nixosModules.nix-index
          ];
          specialArgs = {
            host = "thinkpad";
            username = "optizone";
            inherit
              self
              inputs
              font
              fontMono
              shell
              gitUsername
              gitEmail
              ;
          };
        };

        protei-thinkpad = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/protei-thinkpad
            nix-index-database.nixosModules.nix-index
          ];
          specialArgs = {
            host = "thinkpad";
            username = "boicov";
            gitUsername = "boicov";
            gitEmail = "boicov@protei-lab.ru";
            inherit
              self
              inputs
              font
              fontMono
              shell
              ;
          };
        };

        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/vm
            nix-index-database.nixosModules.nix-index
          ];
          specialArgs = {
            host = "vm";
            username = "optizone";
            inherit
              self
              inputs
              font
              fontMono
              shell
              gitUsername
              gitEmail
              ;
          };
        };
      };
    };
}
