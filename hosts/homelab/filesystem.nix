{ ... }:
{
  fileSystems = {
    "/boot/firmware".options = [
      "noatime"
      "noauto"
      "x-systemd.automount"
      "x-systemd.idle-timeout=1min"
    ];
    "/boot/firmware".device = "/dev/mmcblk0p1";

    "/".options = [ "noatime" ];
    "/".device = "/dev/mmcblk0p2";
  };
}
