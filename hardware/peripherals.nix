{ lib, vars, ... }:

let
  # isLaptop
  isLaptop = vars.machineType == "laptop";
in
{
  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true;
    wireplumber.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Brightness
  programs.light.enable = isLaptop;

  # Power & Battery
  services.power-profiles-daemon.enable = isLaptop;
  services.auto-cpufreq.enable = isLaptop;

  # Printing
  services.printing.enable = true;
  services.printing.cups-pdf.enable = true;
  # services.avahi = {
  #   enable = true;
  #   nssmdns4 = true;
  #   openFirewall = true;
  # };

  # Touchpad
  services.libinput = lib.mkIf isLaptop {
    enable = true;
    touchpad = {
      tapping = true;
      naturalScrolling = true;
      scrollMethod = "twofinger";
    };
  };

  # Firmware updates
  services.fwupd.enable = true;

  # Xbox Controllers
  #hardware.xone.enable = true;
  #hardware.xpadneo.enable = true;
}
