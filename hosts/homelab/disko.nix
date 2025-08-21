{ ... }:
{
  disko.devices.disk.sd-card = {
    device = "/dev/sda";
    type = "disk";

    content = {
      type = "gpt";

      partitions = {
        FIRMWARE = {
          label = "FIRMWARE";
          priority = 1;
          type = "0700";
          attributes = [
            0 # Required Partition
          ];
          size = "1024M";
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot/firmware";
            mountOptions = [
              "noatime"
              "noauto"
              "x-systemd.automount"
              "x-systemd.idle-timeout=1min"
            ];
          };
        };

        ESP = {
          label = "EPS";
          type = "EF00";
          size = "1024M";
          attributes = [
            2 # Legacy BIOS Bootable, for U-Boot to find extlinux config
          ];
          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
            mountOptions = [
              "noatime"
              "noauto"
              "x-systemd.automount"
              "x-systemd.idle-timeout=1min"
              "umask=0077"
            ];
          };
        };

        root = {
          size = "100%";
          content = {
            type = "filesystem";
            format = "ext4";
            mountpoint = "/";
          };
        };
      };
    };
  };
}
