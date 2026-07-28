{ lib, ... }:

let

  vars = import ./vars.nix;

in
{
  imports = [
    ./hardware-configuration.nix
    ./hardware
    ./system
    ./software
    ./packages.nix
  ];

  # Pass vars to all modules
  _module.args.vars = vars;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # System
  system.autoUpgrade.enable = true;
  #system.autoUpgrade.allowReboot = true;
  system.stateVersion = vars.stateVersion;
}
