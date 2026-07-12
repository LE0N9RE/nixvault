{ config, ... }:

{
  preservation.enable = true;

  preservation.preserveAt."/persistent" = {
    files = [
      "/etc/machine-id"
    ];

    directories = [
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager"
    ];

    users.a3n = {
      directories = [
        "dotfiles"
        ".config"
        "Projects"
        "Programs"
        "Documents"
        "Pictures"
        "Videos/Saved"
      ];

      files = [
        ".bash_history"
        ".gitconfig"
        ".git-credentials"
      ];
    };
  };
}
