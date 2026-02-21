{ lib, vars, ... }:

{
  # Docker
  virtualisation.docker = lib.mkIf vars.dockerEnable {
    enable = true;
    storageDriver = "overlay2";
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
