{
  pkgs,
  lib,
  vars,
  ...
}:

let

  gpuDrivers = {
    "vm" = [ "modesettings" ];
    "amd" = [ "amdgpu" ];
    "intel" = [ "modesettings" ];
    "nvidia" = [ "nvidia" ];
  };

  gpuPackages = {
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

  # GPU
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = gpuPackages.${vars.gpu} or [ ];
    extraPackages32 = gpuPackages32.${vars.gpu} or [ ];
  };

}
