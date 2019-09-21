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
      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home.nix
#      ./containers.nix      
    ];

  hardware = {
#    enableRedistributableFirmware = true;
    enableAllFirmware = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
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
#    kernelParams = [ /* list of command line arguments */ ];
#    kernelPackages = pkgs.linuxPackages_5_1;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
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
      externalInterface = "enp0s31f6";
    };
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:
  virtualisation.docker.enable = true;

  programs = {
    fish.enable = true;
    vim.defaultEditor = true;
    bash.enableCompletion = true;
  };

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
    openssh.permitRootLogin = "no";
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
##  hardware.pulseaudio.enable = true;
##  hardware.pulseaudio.support32Bit = true;

  # services.xserver.videoDrivers = [ "nvidia" ]; 
  
  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # services.xserver.autorun = false;

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.windowManager.i3.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };
  users.mutableUsers = false;

#  programs.bash.shellInit = "screenfetch";
#  programs.fish.shellInit = "screenfetch";
  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;
  nix.gc.automatic = true;

  swapDevices = [ { device = "/swapfile"; } ];

}
