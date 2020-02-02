{ config, pkgs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 10d";
    };
    autoOptimiseStore = true;
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
}
