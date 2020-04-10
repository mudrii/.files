#  Edit this configuration file to define what should be installed on
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
      ./users.nix
      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home.nix
#      ./containers.nix
    ];

  boot = {
    loader = {
			grub.enable = true;
			grub.version = 2;
      grub.device = "/dev/sda";
      grub.enableCryptodisk = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
#    kernelModules = [ "bcm2835-v4l2" ];
#    extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
#    kernelParams = [ "nvidia-drm.modeset=1" ];
  };


  # Use the GRUB 2 boot loader.
##  boot.loader.grub.enable = true;
##  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
##  boot.loader.grub.device = "/dev/sda";

  #boot.initrd.luks.devices.crypted.device = "/dev/disk/by-uuid/e7e05d3b-48ef-4118-8ed8-710c4f6a143b";
  #fileSystems."/".device = "/dev/mapper/crypted";
  #/dev/disk/by-partuuid/
  #Should grub be used as bootloader, and /boot is located on an encrypted partition, it is necessary to add the following grub option:
##  boot.loader.grub.enableCryptodisk = true;
##  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking = {
    hostName = "nixos";
#    networkmanager.enable = true;
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
      externalInterface = "ens3";
    };
  # Open ports in the firewall.
    firewall = {
  # Or disable the firewall altogether.
      enable = false;
      allowedTCPPorts = [ 22 80 ];
      allowedUDPPorts = [ 53 ];
      allowPing = true;
      trustedInterfaces = [ "docker0" ];
    };
  };


  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
##  networking.hostName = "nixos"; 

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

##  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
##  networking.enableIPv6 = false;
##  networking.nat.enable = true;
##  networking.nat.internalInterfaces = ["ve-+"];
##  networking.nat.externalInterface = "ens3";  

  # Select internationalisation properties.
   i18n = {
     consoleFont = "Lat2-Terminus16";
     consoleKeyMap = "us";
     defaultLocale = "en_US.UTF-8";
   };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";
  time.timeZone = "Asia/Singapore";

  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  programs = {
    fish.enable = true;
    vim.defaultEditor = true;
    bash.enableCompletion = true;
  };

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true; 
  };

  # Enable the OpenSSH daemon.
  services = {
    openssh.enable = true;
    openssh.permitRootLogin = "no";
  };


  # List services that you want to enable:
  
##  programs.fish.enable = true;

##  programs.vim.defaultEditor = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
##  services.openssh.enable = true;
##  services.openssh.permitRootLogin = "no";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable touchpad support.
  # services.xserver.libinput.enable = true;

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

##  users.mutableUsers = false;

#  programs.bash.shellInit = "screenfetch";
##  programs.bash.enableCompletion = true;
##  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  #system.stateVersion = "18.09"; # Did you read the comment?
	system.stateVersion = "19.03"; # Did you read the comment?

##  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;

  swapDevices = [ { device = "/swapfile"; } ];
}
