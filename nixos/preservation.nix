{ config, ... }: {
  # Turn on preservation
  preservation.enable = true;

  # Tell the system to save these things to persistent storage area
  preservation.preserve."/persistent" = {
    # System settings that must stay across reboots
    files = [
      "/etc/machine-id"
    ];

    directories = [
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/NetworkManager"
    ];

    # = user folders will not be delated
    users.a3n = {
      directories = [
        "dotfiles"       # GitHub repo folder
        ".config"        # app settings (Discord, themes, etc.)
        "Projects"       # coding/development projects
        "Programs"       # custom software/binaries
        "Documents"      # Personal documents
        "Pictures"       # photos/wallpapers
        "Videos/Saved"   # special folder for videos to keep permanently
      ];

      files = [
        ".bash_history"     # Keeps terminal command history
        ".gitconfig"        # Keeps GitHub identity
        ".git-credentials"  # Keeps GitHub login active
      ];
    };
  };
}
