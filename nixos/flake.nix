{
  description = "My NixOS flake configuration";

  inputs = {
    # Core
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Desktop
    mangowm.url = "github:mangowm/mango";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # System management
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";

    # Applications
    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.a3n = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

      specialArgs = { inherit inputs; };
        modules = [
          # External modules
          inputs.mangowm.nixosModules.mango
          inputs.disko.nixosModules.disko
          inputs.preservation.nixosModules.preservation
          inputs.aagl.nixosModules.default
          inputs.nix-flatpak.nixosModules.nix-flatpak

          # Local modules
          ./configuration.nix
          ./disko.nix
          ./preservation.nix
        ];
      };
    };
}
