{
  lib,
  pkgs,
  vars,
  ...
}:

{
  environment.systemPackages =
    with pkgs;
    [
      # Core & System
      linux-firmware
      git
      gh
      curl
      wget
      nano
      vim
      less
      fwupd
      fwupd-efi
      xdg-user-dirs
      bubblewrap
      spectre-meltdown-checker
      parallel
      appimage-run
      dbus
      avahi
      samba
      cifs-utils
      gvfs
      exfat
      ntfs3g
      udiskie
      bzip3
      gzip
      gnutar
      unrar
      unzip
      zip
      fd
      jq
      ripgrep
      htop
      btop
      lm_sensors
      inxi
      pciutils
      patchelf
      dmidecode

      # Vulkan & Mesa
      vulkan-tools
      vulkan-headers
      vulkan-loader
      mesa
      mesa-demos

      # X11
      libxft
      libxrandr
      libxcomposite
      libxi
      libxinerama
      libxscrnsaver
      xorgserver
      xinit
      xrandr
      xdpyinfo
      xsel
      xclip

      # WM
      awesome
      picom
      wireplumber
      playerctl
      arandr
      networkmanagerapplet

      # Polkit
      kdePackages.polkit-kde-agent-1

      # Theming
      lxappearance
      kdePackages.qt6ct
      kdePackages.breeze-icons
      kdePackages.breeze-gtk
      papirus-icon-theme
      adwaita-icon-theme

      # Fonts
      nerd-fonts.jetbrains-mono
      dejavu_fonts
      noto-fonts
      noto-fonts-color-emoji

      # Launcher
      (rofi.override { plugins = [ rofi-emoji ]; })

      # Terminal
      alacritty
      zsh
      zsh-powerlevel10k

      # File Manager
      ranger
      ueberzug
      poppler-utils
      kdePackages.kio
      kdePackages.kio-fuse
      kdePackages.kio-extras
      kdePackages.dolphin
      kdePackages.qtsvg
      kdePackages.ark
      kdePackages.konsole

      # Multimedia
      vlc
      sxiv
      flameshot
      krita
      kdePackages.kdenlive
      obs-studio

      # Network
      firefox
      thunderbird
      discord
      element-desktop
      filezilla
      transmission_4-qt
      angryipscanner
      sshx
      wrk
      rustdesk-flutter

      # Dev
      gcc
      gdb
      gnumake
      cmake
      cargo
      rustc
      rustup
      nodejs
      neovim
      vscodium-fhs
      python315

      # Office
      libreoffice

      # Printer
      brlaser

      # Tools
      gparted
      caligula
      timeshift
    ]

    # Laptop Only
    ++ lib.optionals (vars.machineType == "laptop") [
      auto-cpufreq
    ]

    # Wine & Gaming
    ++ lib.optionals vars.gamingEnable [
      gnutls
      libxcrypt
      mangohud
      fontconfig
      faudio
      freetype
      flex
      fluidsynth
      mpg123
      openal
      krb5
      giflib
      gst123
      gst_all_1.gst-vaapi
      gst_all_1.gst-libav
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      gst_all_1.gst-plugins-ugly
      gst_all_1.gstreamer
      libpng
      v4l-utils
      libgpg-error
      libjpeg
      libgcrypt
      ncurses
      ocl-icd
      libxslt
      libGLU
      sqlite
      gamemode
      vkbasalt
      cabextract
    ]

    # Docker
    ++ lib.optionals vars.dockerEnable [
      docker
      docker-compose
      docker-buildx
    ]

    # VMWare
    ++ lib.optionals vars.vmwareEnable [
      linuxKernel.packages.linux_6_12.vmware
      vmware-workstation
    ];

  # Flatpak
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";
  services.flatpak.enable = true;

  # Steam
  programs.steam.enable = vars.gamingEnable;

  # Dolphin
  environment.etc."xdg/menus/applications.menu".source = "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";

}
