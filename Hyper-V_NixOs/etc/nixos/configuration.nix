# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running nixos-help).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.enableIPv6 = false;

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    commonsCompress
    p7zip
    unzip
    jq
    lsof
    htop
		python37Packages.pygments
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  virtualisation.docker.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Define a user account. Don't forget to set a password with passwd.
  users.users.mudrii = {
    isNormalUser = true;
    home = "/home/mudrii";
    description = "mudrii";
    extraGroups = [ "wheel" "docker" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfaFqvY4lhx4KGvd2WEnd6m7zoDNvLRVYSBXEUWTjiGZ8DddD+tDC4I8MvPsEHUw3pYjBicOPsVK356dviu6JpEuhzxzW2/6YJvFN8EqPZIFcX9rNz3YNEkEam+SEWjwtjMe+hpB6FNwofZKvlqS73y3DYERpobYax548nOxGseCPBuXRlB7nmABe1wKs/YWVg4GbM+HYofgYWFkqYEgVM6HG4P7/kcywmaDqYoaO32fGtEm9VIBAmlDU35eA+U/E4kaxOWr2HmjOL2tMbhxYoMNuRFAvOHnWveSOA/MlQorcI5a8BLK5oZFP2BgtG1vuNPueb2c2UxGe+y6KT3Biz mudre@Nelu" ];
  };

  programs.bash.shellAliases = {
    cat="pygmentize -f terminal256 -g -P style=monokai";
    lo="ls -lha --color=auto --group-directories-first";
    dmesg="dmesg --color=always | less";
    sudo="sudo -i";
    ls="ls --color=auto";
    diff="diff --color=auto";
    vdir="vdir --color=auto";
    grep="grep --color=auto";
    fgrep="fgrep --color=auto";
    egrep="egrep --color=auto";
    mv="mv -i";
    rm="rm -i";
    cp="cp -i";
    exit="clear ; exit";
  };

  #programs.bash.shellInit = "screenfetch";
  programs.bash.enableCompletion = true;
  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?

  system.autoUpgrade.enable = true;

  swapDevices = [ { device = "/swapfile"; } ];

}

