{ config, pkgs, ... }:

{

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
#    enableAllFirmware = true;

    bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };

    opengl.driSupport32Bit = true;

    nvidia = {
      modesetting.enable = true;
      optimus_prime = {                                             
        enable = true;                                                              
        intelBusId = "PCI:0:2:0";                                                   
        nvidiaBusId = "PCI:1:0:0";                                                  
      };
    };
  };

}
