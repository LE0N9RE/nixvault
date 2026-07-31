{ pkgs, inputs, ... }:

{
  # Flatpak
  services.flatpak = {
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];

    packages = [
      "org.vinegarhq.Sober"
    ];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    # Terminal and system tools
    kitty
    git
    fastfetch

    # Desktop utilities
    nautilus
    rofi
    awww
    cava
    waylyrics
    sptlrx
    peaclock

    # Applications
    inputs.zen-browser.packages.${pkgs.system}.default
    firefox
    zed-editor
    discord
    spotify
    mpvpaper

    # Desktop integration
    glib
    gvfs
    xdg-user-dirs
    dconf
    gsettings-desktop-schemas
    whitesur-icon-theme
  ];
}
