{ config, pkgs, ... }:

{
  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
#    enableAllFirmware = true;
#    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };
}
