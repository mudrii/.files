# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

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
#    enableRedistributableFirmware = true;
    enableAllFirmware = true;
#    bluetooth.enable = true;
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
#    kernelModules = [ "bcm2835-v4l2" ];
#    extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
#    kernelParams = [ "nvidia-drm.modeset=1" ];
  };

  powerManagement = {
    enable = true;
#    powertop.enable = true;
#    cpuFreqGovernor =  "ondemand"; # "powersave", "performance" 
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    useDHCP = false;
    interfaces = {
      enp3s0f0.useDHCP = true;
#      enp3s0f1.useDHCP = true;
#      enp3s0f2.useDHCP = true;
#      enp3s0f3.useDHCP = true;
#      wlp0s20u9u2.useDHCP = true;
    };
  # Enables wireless support via wpa_supplicant.
#    wireless.enable = true;  
  #  Configure network proxy if necessary
#    proxy.default = "http://user:password@proxy:port/";
#    proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    enableIPv6 = false;
    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "enp3s0f0";
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
    openssh.enable = true;
    openssh.permitRootLogin = "no";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  
#  programs.bash.shellInit = "screenfetch";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

  system.autoUpgrade = {
    enable = true;
    dates = "22:00";
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 10d";
  };

  swapDevices = [ { device = "/swapfile"; } ];

}
