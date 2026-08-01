{
  pkgs,
  lib,
  vars,
  ...
}:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs."linuxPackages_${vars.kernelVersion}" or pkgs.linuxPackages_latest;

  # Avoid touchpad click to tap (clickpad) bug
  # https://wiki.archlinux.org/title/Touchpad_Synaptics#Touchpad_does_not_work_after_resuming_from_hibernate/suspend
  boot.kernelParams = lib.optionals (vars.machineType == "laptop") [
    "psmouse.synaptics_intertouch=0"
  ];
}
