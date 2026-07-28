{ pkgs, vars, ... }:

{
  nixpkgs.overlays = [
    
    (final: prev: {
      awesome = prev.awesome.overrideAttrs (old: {
        version = "git";
        src = prev.fetchFromGitHub {
          owner = "awesomeWM";
          repo = "awesome";
          rev = "39143f036e10c34c0a4a2eb604399fd20cf8376e";
          hash = "sha256-M9EQV5kwiTeSqZLXQ6uAtMyvOhCQXM9ctgiu2ZRI+QQ=";
        };
        patches = [ ];
        postPatch = ''
          patchShebangs .
        '';
        cmakeFlags = (old.cmakeFlags or [ ]) ++ [
          "-DOVERRIDE_VERSION=git-39143f0"
          "-DGENERATE_DOC=OFF"
          "-DGENERATE_MANPAGES=OFF"
        ];
      });
    })

  ];

  # X11
  services.xserver = {
    enable = true;

    # Keyboard layout
    xkb.layout = vars.keyLayout;
    xkb.variant = vars.keyVariant;

    # AwesomeWM
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
        lgi
      ];
    };
  };

  # Compositor
  services.picom.enable = true;
  
  # Polkit
  systemd.user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
      Restart = "on-failure";
      RestartSec = 1;
      TimeoutStopSec = 10;
    };
  };

}
