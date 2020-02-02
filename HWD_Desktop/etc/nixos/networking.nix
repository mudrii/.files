{ config, pkgs, ... }:

{
  networking = {
    hostName = "desktop-nixos";
    networkmanager.enable = true;
    useDHCP = false;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    enableIPv6 = false;
    interfaces = {
      enp3s0f0.useDHCP = true;
#      enp3s0f1.useDHCP = true;
#      enp3s0f2.useDHCP = true;
#      enp3s0f3.useDHCP = true;
#      wlp0s20u9u2.useDHCP = true;
    };

  # Enables wireless support via wpa_supplicant.
#    wireless.enable = true;  
  #  Configure network proxy if necessary
#    proxy.default = "http://user:password@proxy:port/";
#    proxy.noProxy = "127.0.0.1,localhost,internal.domain";

#    nat = {
#      enable = true;
#      internalInterfaces = ["ve-+"];
#      externalInterface = "enp3s0f0";
#    };

  # Open ports in the firewall.
    firewall = {
  # Or disable the firewall altogether.
      enable = false;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ 53 ];
      allowPing = true;
      trustedInterfaces = [ "docker0" ];
    };
  };
}
