{ ... }:

{
  # Machine
  hostname      = "bonbon";
  machineType   = "desktop"; # "desktop" or "laptop"
  gpu           = "amd"; # VM -> "vm"
  kernelVersion = "6_12";
  stateVersion  = "25.11";

  # User
  username = "plunne";
  userGroups = [
    "networkmanager"
    "wheel"
    "docker"
    "video"
    "audio"
  ];

  # Keymap
  # US et FR

  # Miscs
  dockerEnable = true;
  vmwareEnable = false;
  steamEnable = true;
}
