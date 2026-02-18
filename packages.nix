{
  lib,
  pkgs,
  ...
}:

{
  environment.systemPackages =
    with pkgs;
    [
      # Core & System
      bubblewrap
      nano
      wget
      inxi
      pciutils
      xdg-user-dirs
      htop
      btop
      linux-firmware
      spectre-meltdown-checker
      fwupd
      fwupd-efi
      wireplumber
      lm_sensors
      appimage-run
      patchelf
      dmidecode
      avahi
      samba
      cifs-utils
      auto-cpufreq
      unzip
      fd

      # WM & Compositor
      awesome
      picom

      # Launcher & Notifications
      rofi
      rofi-emoji
      dunst

      # Bars & Widgets
      lxappearance
      arandr
      xorg.xrandr
      xorg.xdpyinfo
      xsel
      xclip
      flameshot
      feh
      sxiv
      networkmanagerapplet

      # Polkit
      polkit_gnome

      # Fonts
      nerd-fonts.jetbrains-mono
      dejavu_fonts
      noto-fonts
      noto-fonts-emoji

      # Icons & Themes
      breeze-icons
      breeze-gtk
      papirus-icon-theme
      adwaita-icon-theme

      # Terminal
      alacritty
      zsh
      zsh-powerlevel10k

      # Emacs
      emacs
      ripgrep

      # Tools
      gparted
      angryipscanner
      caligula
      sshx
      timeshift
      wrk
      rustdesk-flutter

      # Dev
      git
      pre-commit
      shfmt
      bats
      parallel
      shellcheck
      vscodium-fhs
      haskellPackages.ShellCheck
      sublime-merge
      jq

      # Web
      filezilla
      firefox
      element-desktop
      vesktop
      thunderbird
      riseup-vpn
      transmission_4-qt

      # Media & Video
      mpv
      playerctl

      # VPN
      wireguard-tools

      # Vulkan & Mesa
      vulkan-tools
      vulkan-headers
      vulkan-loader
      mesa
      mesa-demos

      # X11
      xorg.libXft
      xorg.libXrandr
      xorg.libXcomposite
      xorg.libXi
      xorg.libXinerama
      xorg.libXScrnSaver

      # File Manager
      ranger
      pcmanfm

      # Office
      onlyoffice-desktopeditors

      # Wine & Gaming
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

    # Conditional packages
    ++ lib.optionals vars.dockerEnable [
      docker
      docker-compose
      docker-buildx
    ]

    ++ lib.optionals vars.vmwareEnable [
      linuxKernel.packages.linux_6_12.vmware
      vmware-workstation
    ];

  # Flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;

  # Steam
  programs.steam.enable = vars.steamEnable;
}
