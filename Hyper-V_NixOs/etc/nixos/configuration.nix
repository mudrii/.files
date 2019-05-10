# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running nixos-help).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./fonts.nix
      ./users.nix
      ./aliases.nix
    ];

  # Use the GRUB 2 boot loader.
  #boot.loader.grub.enable = true;
  #boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Use the systemd-boot EFI boot loader. 
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Define on which hard drive you want to install Grub.
  # boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  #boot.loader.grub.device = "/dev/sda";

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.hostName = "nixos"; 
  
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.enableIPv6 = false;
  networking.nat.enable = true;
  networking.nat.internalInterfaces = ["ve-+"];
  networking.nat.externalInterface = "eth0";  

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";
  time.timeZone = "Asia/Singapore";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];

  virtualisation.docker.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  programs.fish.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

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

  # Define a user account. Don't forget to set a password with passwd.
  # users.users.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

  users.mutableUsers = false;

#    hashedPassword = "$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
#    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfaFqvY4lhx4KGvd2WEnd6m7zoDNvLRVYSBXEUWTjiGZ8DddD+tDC4I8MvPsEHUw3pYjBicOPsVK356dviu6JpEuhzxzW2/6YJvFN8EqPZIFcX9rNz3YNEkEam+SEWjwtjMe+hpB6FNwofZKvlqS73y3DYERpobYax548nOxGseCPBuXRlB7nmABe1wKs/YWVg4GbM+HYofgYWFkqYEgVM6HG4P7/kcywmaDqYoaO32fGtEm9VIBAmlDU35eA+U/E4kaxOWr2HmjOL2tMbhxYoMNuRFAvOHnWveSOA/MlQorcI5a8BLK5oZFP2BgtG1vuNPueb2c2UxGe+y6KT3Biz mudre@Nelu" ];

  #programs.bash.shellInit = "screenfetch";
  programs.bash.enableCompletion = true;
  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.03"; # Did you read the comment?

  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;

  swapDevices = [ { device = "/swapfile"; } ];

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

}
