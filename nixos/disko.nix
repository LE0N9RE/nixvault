{ ... }:
{
  fileSystems."/nix".neededForBoot = true;
  fileSystems."/persistent".neededForBoot = true;

  disko.devices = {
    nodev."/" = {
      fsType = "tmpfs";

      mountOptions = [
        "size=25%"
        "mode=755"
      ];
    };

    disk.main = {
      type = "disk";

      # Stable path for your Patriot P300 1 TB NVMe drive.
      device =
        "/dev/disk/by-id/nvme-Patriot_M.2_P300_1024GB_P300WCBA25040111438";

      content = {
        type = "gpt";

        partitions = {
          ESP = {
            priority = 1;
            name = "EFI";
            start = "1M";
            size = "1G";
            type = "EF00";

            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";

              mountOptions = [
                "umask=0077"
              ];
            };
          };

          swap = {
            priority = 2;
            name = "swap";
            size = "8.8G";

            content = {
              type = "swap";
              discardPolicy = "both";
              resumeDevice = true;
            };
          };

          nix = {
            priority = 3;
            name = "nix";
            size = "300G";

            content = {
              type = "filesystem";
              format = "f2fs";
              mountpoint = "/nix";

              extraArgs = [
                "-f"
                "-l"
                "nix"
              ];

              mountOptions = [
                "noatime"
                "lazytime"
                "discard"
              ];
            };
          };

          persistent = {
            priority = 4;
            name = "persistent";
            size = "100%";

            content = {
              type = "filesystem";
              format = "f2fs";
              mountpoint = "/persistent";

              extraArgs = [
                "-f"
                "-l"
                "persistent"
              ];

              mountOptions = [
                "noatime"
                "lazytime"
                "discard"
              ];
            };
          };
        };
      };
    };
  };
}
