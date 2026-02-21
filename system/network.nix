{ lib, vars, ... }:

{
  networking.hostName = vars.hostname;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.enableIPv6 = false;

  networking.timeServers = [
    "time.cloudflare.com"
  ];

  networking.nameservers = [
    "1.1.1.1"
    "1.0.0.1"
    "606:4700:4700::1111"
    "2606:4700:4700::1001"
  ];

  # Hosts
  networking.extraHosts = ''
    # My Hosts
    192.168.1.1   local.ovh.lan
  '';

  # StevenBlack adblock
  networking.stevenblack = {
    enable = true;
    #block = [ "fakenews" "gambling" "porn" "social" ];
  };

  # VPN WireGuard
  #networking.wg-quick.interfaces = {
  #  wg0 = {
  #    address = [ "IP_CLIENT/32" ];
  #    dns = [ "1.1.1.1" ];
  #    privateKeyFile = "/root/.wireguard/private.key";
  #    peers = [
  #      {
  #        publicKey = "PUBLIC_KEY";
  #        allowedIPs = [ "0.0.0.0/24" ];
  #        endpoint = "SERVER_IP:PORT";
  #        persistentKeepalive = 25;
  #      }
  #    ];
  #  };
  #};

  # NTP
  services.ntpd-rs = {
    enable = true;
    useNetworkingTimeServers = false;
    settings = {
      source = [
        {
          mode = "nts";
          address = "time.cloudflare.com";
        }
        {
          mode = "nts";
          address = "nts.netnod.se";
        }
        {
          mode = "nts";
          address = "paris.time.system76.com";
        }
        {
          mode = "nts";
          address = "ntp3.fau.de";
        }
      ];
    };
  };

  # Samba Browsing
  services.avahi = {
    enable = true;
    nssmdns4 = true;
  };

  # SSH
  services.openssh = lib.mkIf vars.sshEnable {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "yes";
    };
  };

  # Firewall
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # networking.firewall.enable = false;
}
