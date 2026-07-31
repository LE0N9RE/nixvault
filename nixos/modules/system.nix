{ config, pkgs, ... }:

{
  #Boot
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader = {
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
  };

  # Networking
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

  # Automatic system updates
  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

  # Nix store maintenance and binary caches
  nix = {
    gc = {
      automatic = true;
      dates = "daily";
    };

    settings = {
      auto-optimise-store = true;

      substituters = [
        "https://ezkea.cachix.org"
      ];

      trusted-public-keys = [
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
      ];
    };
  };

  # Desktop integration
  services.gvfs.enable = true;
  programs.dconf.enable = true;

  environment.sessionVariables.GIO_EXTRA_MODULES = [
    "${pkgs.glib-networking}/lib/gio/modules"
    "${pkgs.gnome-menus}/lib/gio/modules"
    "${config.systemd.package}/lib/gio/modules"
  ];

  # Bash prompt
  programs.bash.promptInit = ''
    PS1="[\u@\h:\w]\$ "
  '';
}
