{ pkgs, vars, ... }:

{
  # User
  users.users.${vars.username} = {
    isNormalUser = true;
    description = vars.username;
    extraGroups = vars.userGroups;
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  # ZSH
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
  };

  # Sudo-rs
  security.sudo-rs = {
    enable = true;
    package = pkgs.sudo-rs;
    execWheelOnly = false;
    wheelNeedsPassword = true;
  };
}
