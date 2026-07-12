{ config, pkgs, ... }:

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."a3n" = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    hashedPasswordFile = "/persistent/passwords/a3n";
  };

    environment.shellAliases = {
      pushgit  = "~/dotfiles/bash-vault";
      mending = "~/dotfiles/update-vault";
    };
}
