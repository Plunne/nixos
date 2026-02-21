{ lib, vars, ... }:

{
  # VMware
  virtualisation.vmware = lib.mkIf vars.vmwareEnable {
    host.enable = true;
    guest.enable = true;
  };
}
