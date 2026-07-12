{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."a3n" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

    environment.shellAliases = {
      pushgit  = "~/dotfiles/bash-vault";
      mending = "~/dotfiles/update-vault";
    };
}
