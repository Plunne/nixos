{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Kernel modules
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "nvme"
    "ahci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  # Root
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/61b03551-164b-452e-938b-52a9aa3a7913";
    fsType = "btrfs";
    options = [ "subvol=@,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  # Home
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/61b03551-164b-452e-938b-52a9aa3a7913";
    fsType = "btrfs";
    options = [ "subvol=@home,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  # Nix
  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/61b03551-164b-452e-938b-52a9aa3a7913";
    fsType = "btrfs";
    options = [ "subvol=@nix,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  # Cache
  fileSystems."/var/cache" = {
    device = "/dev/disk/by-uuid/61b03551-164b-452e-938b-52a9aa3a7913";
    fsType = "btrfs";
    options = [ "subvol=@cache,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  # Log
  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/61b03551-164b-452e-938b-52a9aa3a7913";
    fsType = "btrfs";
    options = [ "subvol=@log,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  # Boot
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/6C75-6F72";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  swapDevices = [ ];

  networking.useDHCP = lib.mkDefault true;
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
