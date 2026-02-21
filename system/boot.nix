{
  pkgs,
  lib,
  vars,
  ...
}:

let
  kernelPkgs = {
    "6_18" = pkgs.linuxPackages_6_18;
    "6_12" = pkgs.linuxPackages_6_12;
    "latest" = pkgs.linuxPackages_latest;
  };
in
{

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = kernelPkgs.${vars.kernelVersion} or pkgs.linuxPackages_latest;

  # Avoid touchpad click to tap (clickpad) bug
  # https://wiki.archlinux.org/title/Touchpad_Synaptics#Touchpad_does_not_work_after_resuming_from_hibernate/suspend
  boot.kernelParams = lib.optionals (vars.machineType == "laptop") [
    "psmouse.synaptics_intertouch=0"
  ];
}
