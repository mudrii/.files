{ config, pkgs, ... }:

{

  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
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
  };

}
