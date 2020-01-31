{ config, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.enableCryptodisk = true;
    };
  
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = ["nouveau"];
#    extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
#    kernelParams = [ "nvidia-drm.modeset=1" ];
    cleanTmpDir = true;
  };
}
