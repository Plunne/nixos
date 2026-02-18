{ ... }:

{

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/xxxx";
    fsType = "btrfs";
    options = [ "subvol=/@,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/xxxx";
    fsType = "btrfs";
    options = [ "subvol=/@home,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/xxxx";
    fsType = "btrfs";
    options = [ "subvol=/@nix,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/var/cache" = {
    device = "/dev/disk/by-uuid/xxxx";
    fsType = "btrfs";
    options = [ "subvol=/@cache,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/xxxx";
    fsType = "btrfs";
    options = [ "subvol=/@log,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/xxx";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

}
