{ config, pkgs, ... }:

{
  networking = {
    hostName = "p53-nixos";
    networkmanager.enable = true;
    enableIPv6 = false;
    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
  # Enables wireless support via wpa_supplicant.
#    wireless.enable = true;  
  #  Configure network proxy if necessary
#    proxy.default = "http://user:password@proxy:port/";
#    proxy.noProxy = "127.0.0.1,localhost,internal.domain";

#    nat = {
#      enable = true;
#      internalInterfaces = ["ve-+"];
#      externalInterface = "enp0s31f6";
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
