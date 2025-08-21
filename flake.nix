{
  description = "FrostPhoenix's nixos configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixos-raspberrypi.url = "github:nvmd/nixos-raspberrypi/main";

    home-manager-rpi = {
      url = "github:nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixos-raspberrypi";
    };

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

    disko = {
      # the fork is needed for partition attributes support
      url = "github:nvmd/disko/gpt-attrs";
      # url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixos-raspberrypi/nixpkgs";
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
      nixos-raspberrypi,
      disko,
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

        protei = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/protei
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

        homelab = nixos-raspberrypi.lib.nixosSystem {
          specialArgs = {
            host = "homelab";
            username = "nixos";
            inherit inputs shell;
          } // inputs;
          modules = [
            (
              {
                config,
                pkgs,
                lib,
                nixos-raspberrypi,
                disko,
                ...
              }:
              {
                imports = with nixos-raspberrypi.nixosModules; [
                  # Hardware configuration
                  raspberry-pi-4.base
                  raspberry-pi-4.display-vc4
                  raspberry-pi-4.bluetooth
                ];
              }
            )

            # nixos-raspberrypi.nixosModules.raspberry-pi-4.base
            # disko.nixosModules.disko
            ./hosts/homelab/default.nix
          ];
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
