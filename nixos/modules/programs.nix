{ ... }:

{
  # Nix features
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Allow proprietary packages
  nixpkgs.config.allowUnfree = true;

  # Programs
  programs = {
    mango.enable = true;
    hyprland.enable = true;
    localsend.enable = true;
    anime-game-launcher.enable = true;
  };

  # Application services
  services.flatpak = {
    enable = true;
    update.onActivation = true;
  };
  #idk
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
}
