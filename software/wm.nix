{ ... }:

{
  # X11
  services.xserver = {
    enable = true;
    videoDrivers = gpuDrivers.${vars.gpu} or [ "modesettings" ];

    # Keyboard layout
    # xkb.layout = "fr";
    # xkb.variant = "azerty";

    # AwesomeWM
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
  };

  # Compositor
  services.picom = {
    enable = true;
    fade = true;
    shadow = true;
    fadeDelta = 4;
    shadowOpacity = 0.5;
    settings = {
      corner-radius = 8;
    };
  };
}