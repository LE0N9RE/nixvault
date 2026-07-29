{
  description = "My NixOS flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    mangowm.url = "github:mangowm/mango";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    aagl.url = "github:ezKEa/aagl-gtk-on-nix";
    aagl.inputs.nixpkgs.follows = "nixpkgs";

    preservation.url = "github:nix-community/preservation";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations.a3n = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          inputs.mangowm.nixosModules.mango
          inputs.disko.nixosModules.disko
          inputs.preservation.nixosModules.preservation
          inputs.aagl.nixosModules.default


          ./configuration.nix
          ./disko.nix
          ./preservation.nix
        ];
      };
    };
}
