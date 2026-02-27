{
  config,
  pkgs,
  lib,
  vars,
  ...
}:

let

  gpuDrivers = {
    "amd" 	= [ "amdgpu" ];
    "intel" 	= [ "modesettings" ];
    "nvidia" 	= [ "nvidia" ];
    "vm"	= [ "modesettings" ];
  };

  gpuPackages = {
    "amd" = with pkgs; [
      libva-vdpau-driver
      libvdpau-va-gl
      libva
    ];
    "intel" = with pkgs; [
      intel-gpu-tools
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
      libva
    ];
    "nvidia" = with pkgs; [
      libva
    ];
  };

  gpuPackages32 = {
    "amd" = with pkgs; [
      libva
      libva-vdpau-driver
      libvdpau-va-gl
    ];
    "intel" = with pkgs; [
      intel-gpu-tools
      intel-media-driver
      intel-vaapi-driver
      libva-vdpau-driver
      libvdpau-va-gl
      libva
    ];
    "nvidia" = with pkgs; [
      libva
    ];
  };

in
{

  programs.dconf.enable = true;

  # GPU Driver
  services.xserver.videoDrivers = gpuDrivers.${vars.gpu} or [ "modesettings" ];

  # GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = gpuPackages.${vars.gpu} or [ ];
    extraPackages32 = gpuPackages32.${vars.gpu} or [ ];
  };

  # CPU Microcode
  hardware.cpu.amd.updateMicrocode = lib.mkIf (vars.cpu == "amd") (
    lib.mkDefault config.hardware.enableRedistributableFirmware
  );
  hardware.cpu.intel.updateMicrocode = lib.mkIf (vars.cpu == "intel") (
    lib.mkDefault config.hardware.enableRedistributableFirmware
  );

}
