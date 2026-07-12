{ config, pkgs, inputs, ... }: # <-- Added 'inputs' here

{
  nixpkgs.config.allowUnfree = true;
  programs.localsend.enable = true;
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
    inputs.zen-browser.packages.${pkgs.system}.default
  ];
}
