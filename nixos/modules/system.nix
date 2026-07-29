{ config, pkgs, lib, ... }:
{
  # 1. Bootloader & Systemd
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # 2. Networking & Firewall
  networking.hostName = "nixos"; # or whatever your hostname is
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;

  # 3. Automatic Updating & Garbage Collection
  system.autoUpgrade.enable = true;
  system.autoUpgrade.dates = "weekly";

  nix.gc.automatic = true;
  nix.gc.dates = "daily";
  nix.settings.auto-optimise-store = true;


  # trash
  services.gvfs.enable = true;
  # Force the window manager session to pass the modules to Nautilus
    environment.sessionVariables = {
      GIO_EXTRA_MODULES = [ "${pkgs.glib-networking}/lib/gio/modules" "${pkgs.gnome-menus}/lib/gio/modules" "${config.systemd.package}/lib/gio/modules" ];
    };

    #kitty prompt collor
    programs.bash.promptInit = ''
      # This sets a standard, non-colored prompt
      PS1="[\u@\h:\w]\$ "
    '';

  #for color shame to perfer dark
  programs.dconf.enable = true;

#Configures the official ezkea Cachix binary cache so you don't compile Wine/launcher from source
nix.settings = {
  substituters = [ "https://ezkea.cachix.org" ];
  trusted-public-keys = [ "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI=" ];
};

}
