{ lib, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  # Kernel modules
  boot.initrd.availableKernelModules = [
    "ata_piix"
    "mptspi"
    "uhci_hcd"
    "ehci_pci"
    "ahci"
    "sd_mod"
    "sr_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  # Boot
  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/4B52-C9AB";
    fsType = "vfat";
    options = [
      "fmask=0022"
      "dmask=0022"
    ];
  };

  # Root
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/f6771220-9f8b-4026-bb0f-74dc9226e460";
    fsType = "btrfs";
    options = [ "subvol=/@,defaults,ssd,autodefrag,compress-force=zstd" ];

  };

  # Home
  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/f6771220-9f8b-4026-bb0f-74dc9226e460";
    fsType = "btrfs";
    options = [ "subvol=/@home,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/var/cache" = {
    device = "/dev/disk/by-uuid/f6771220-9f8b-4026-bb0f-74dc9226e460";
    fsType = "btrfs";
    options = [ "subvol=/@cache,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  fileSystems."/var/log" = {
    device = "/dev/disk/by-uuid/f6771220-9f8b-4026-bb0f-74dc9226e460";
    fsType = "btrfs";
    options = [ "subvol=/@log,defaults,ssd,autodefrag,compress-force=zstd" ];
  };

  swapDevices = [{
    device = "/dev/disk/by-uuid/e1def8dc-03cf-40a8-bf4c-db710e4ef837";
  }];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}
