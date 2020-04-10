{ config, pkgs, ... }:

{

# List services that you want to enable:
  virtualisation = {
    docker.enable = true;
    libvirtd.enable = true;
#    virtualbox = {
#      host.enable = true;
#      host.enableExtensionPack = true;
#    };
  };

}
