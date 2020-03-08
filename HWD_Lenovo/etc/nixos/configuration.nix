# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./hardware.nix
      ./boot.nix
      ./networking.nix
      ./programs.nix
      ./services.nix
      ./packages.nix
      ./fonts.nix
      ./aliases.nix
      ./users.nix
      <home-manager/nixos>
#      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home.nix
      ./nix.nix
      ./virtualisation.nix
#      ./containers.nix      
    ];

#  powerManagement = {
#    enable = true;
##    powertop.enable = true;
##    cpuFreqGovernor =  "ondemand"; # "powersave", "performance" 
##    cpuFreqGovernor =  "powersave"; # "ondemand", "performance" 
#  };

#  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
#  environment.systemPackages = with pkgs; [ xorg.xbacklight ];

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # TPM has hardware RNG
  security = {
    rngd.enable = true;
    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
  };

  # Enable sound.
  sound.enable = true;
  
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}
