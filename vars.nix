{
  # Machine
  hostname = "bonbon";
  machineType = "desktop"; # desktop or laptop
  cpu = "amd"; # amd or intel
  gpu = "amd"; # amd, intel, nvidia, vm
  kernelVersion = "7_1";
  stateVersion = "26.05";

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
  dockerEnable = false;
  vmwareEnable = false;
  gamingEnable = true;
  sshEnable = true;
}
