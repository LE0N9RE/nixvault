{
  description = "My NixOS flake configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    mangowm.url = "github:mangowm/mango";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    preservation.url = "github:Wandmalfarbe/preservation";
  };
  outputs =
    { self, nixpkgs,disko, preservation, ... }@inputs:
    {
      nixosConfigurations.a3n =
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          specialArgs = {
            inherit inputs;
          };
          modules = [
            inputs.mangowm.nixosModules.mango
            disko.nixosModules.disko
            preservation.nixosModules.preservation

            ######################################
            ./configuration.nix
            ./hardware-configuration.nix

            ./modules/hardware.nix
            ./modules/system.nix
            ./modules/user.nix
            ./modules/utils.nix
            ./modules/packages.nix
            ./modules/mangowm.nix
            ./disko.nix
            ./preservation.nix
          ];
        };
    };
}
