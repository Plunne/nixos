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
    enableBashCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [
      "git"
      "sudo"
    ];
    custom = "$HOME/.oh-my-zsh/custom/";
    theme = "powerlevel10k/powerlevel10k";
  };

  # Sudo-rs
  security.sudo-rs = {
    enable = true;
    package = pkgs.sudo-rs;
    execWheelOnly = false;
    wheelNeedsPassword = true;
  };
}
