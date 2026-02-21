{ ... }:

{
  # Display Manager
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    theme = "breeze";
  };

  services.displayManager.defaultSession = "none+awesome";
}
