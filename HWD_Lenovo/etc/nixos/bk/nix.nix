{ config, pkgs, ... }:

{

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      #dates = "Mon *-*-* 06:00:00";      
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  nixpkgs.config = {
    pulseaudio = true;
    allowBroken = true;
    allowUnfree = true; 
  };

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
    #dates = "Sun *-*-* 04:00:00";
  };

}
