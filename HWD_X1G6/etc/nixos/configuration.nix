# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./fonts.nix
      ./aliases.nix
      ./xserver.nix
      ./users.nix
      <home-manager/nixos>
#      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home.nix
#      ./containers.nix      
    ];

  hardware = {
    cpu.intel.updateMicrocode = true;
#    enableRedistributableFirmware = true;    
    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.enableCryptodisk = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

#  powerManagement = {
#    enable = true;
#  };

  networking = {
    hostName = "andre-nixos";
    networkmanager.enable = true;
  # Enables wireless support via wpa_supplicant.
#    wireless.enable = true;  
  #  Configure network proxy if necessary
#    proxy.default = "http://user:password@proxy:port/";
#    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    enableIPv6 = false;
    useDHCP = false;
    interfaces = {
        enp0s31f6.useDHCP = true;
        wlp2s0.useDHCP = true;
    };
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

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

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

  programs = {
    fish.enable = true;
    vim.defaultEditor = true;
    bash.enableCompletion = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };    
  };

  nixpkgs.config = {
    pulseaudio = true;
    allowBroken = true;
    allowUnfree = true; 
  };

  # Enable the OpenSSH daemon.
  services = {
    openssh = { 
        enable = true;
        permitRootLogin = "no";
    };
# Enable CUPS to print documents.
	printing = {
      enable = true;
#      drivers = [ unstable.pkgs.epson-escpr ];
    };
    avahi = {
      enable = true;
      nssmdns = true;
    };
    tlp = {
      enable = true;
      extraConfig = ''
#        DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"
        START_CHARGE_THRESH_BAT0=70
        STOP_CHARGE_THRESH_BAT0=90
        CPU_SCALING_GOVERNOR_ON_AC=powersave
        CPU_SCALING_GOVERNOR_ON_BAT=powersave
        ENERGY_PERF_POLICY_ON_AC=balance-performance
        ENERGY_PERF_POLICY_ON_BAT=power
      '';
    };
    blueman.enable = true;    
  };

  # TPM has hardware RNG
  security.rngd.enable = true;

  # Enable sound.
  sound.enable = true;

#  programs.bash.shellInit = "neofetch";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

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

}
