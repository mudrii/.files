{ config, pkgs, ... }:
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # environment.systemPackages = with pkgs; [
  #   wget vim
  # ];
  environment.systemPackages = with pkgs; [
    wget
    vim
    commonsCompress
    p7zip
    unzip
    lsof
    acpi
    pciutils
    usbutils
    powertop
    tree
    ag
    htop
    atool
    rsync
    gnutls
    bind
    mkpasswd
    openssl
    file
    python37Packages.pygments
  ];
  
#  nixpkgs.config.allowBroken = true;
}
