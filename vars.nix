{
  # Machine
  hostname = "cookie";
  machineType = "desktop"; # desktop or laptop
  cpu = "amd"; # amd or intel
  gpu = "vm"; # amd, intel, nvidia, vm
  kernelVersion = "6_12";
  stateVersion = "25.11";

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
  keyLayout = "us"; # "us" or "fr"
  keyVariant = ""; # "" for us, "azerty" for fr

  # Miscs
  dockerEnable = true;
  vmwareEnable = false;
  gamingEnable = true;
  sshEnable = true;
}
