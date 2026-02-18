{ pkgs, ... }:

{
  # Timezone
  time.timeZone = "Europe/Paris";

  # Locale
  i18n.defaultLocale = "fr_FR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Console keymap
  #console.keyMap = "fr";

  # Language support
  environment.systemPackages = with pkgs; [
    poppler_data
    hunspell
    hunspellDicts.fr-any
    hyphen
    texlivePackages.hyphen-french
  ];
}
