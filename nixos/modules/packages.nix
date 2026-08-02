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
    #program lang
    cargo
    rustc
    rust-analyzer

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
    steam-run
    jdk21
    xwayland-satellite
    xcursorgen

    # Applications
    inputs.zen-browser.packages.${pkgs.system}.default
    firefox
    zed-editor
    discord
    spotify
    mpvpaper
    steam
    bitwarden-desktop
    # Desktop integration
    glib
    gvfs
    xdg-user-dirs
    dconf
    gsettings-desktop-schemas
    whitesur-icon-theme
    xorg.libXtst
    xorg.libX11
    xorg.libXext

    #video/screen
    obs-studio
    hyprshot
  ];
}
