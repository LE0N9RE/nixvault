{ config, pkgs, inputs, ... }: # <--

{
  nixpkgs.config.allowUnfree = true;
  programs.localsend.enable = true;
  programs.anime-game-launcher.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    kitty
    nautilus
    zed-editor
    firefox
    git
    awww
    rofi
    glib
    gvfs
    xdg-user-dirs
    whitesur-icon-theme
    dconf
    gsettings-desktop-schemas
    discord
    fastfetch
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
