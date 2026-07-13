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
  "/etc/NetworkManager/system-connections"
];

users.a3n = {
  directories = [
    "dotfiles"
    ".config"
    ".local/share/zed"
    ".ssh"
    "Projects"
    "Programs"
    "Documents"
    "Pictures"
    "Saved"
    ];

        files = [
        ".bash_history"
      ];
    };
  };
}
