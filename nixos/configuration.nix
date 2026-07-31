
{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/hardware.nix
    ./modules/system.nix
    ./modules/user.nix
    ./modules/utils.nix
    ./modules/packages.nix
    ./modules/mangowm.nix
    ./modules/programs.nix
  ];

  system.stateVersion = "26.05";
}
