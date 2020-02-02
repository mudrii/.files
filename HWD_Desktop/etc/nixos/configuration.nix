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
#      ./containers.nix      
    ];

#  powerManagement = {
#    enable = true;
#    powertop.enable = true;
#    cpuFreqGovernor =  "ondemand"; # "powersave", "performance" 
#  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:
  virtualisation = {
    docker.enable = true;
#    virtualbox.host.enable = true;
#    virtualbox.host.enableExtensionPack = true;
  };

  security = {
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

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };
}
