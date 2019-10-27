{ config, pkgs, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{
  
  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  environment.systemPackages = with pkgs; [
    nix-index
    nix-review
    nix-prefetch-git 
    nix-prefetch-scripts
    mc
    traceroute
    whois
    nmap
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
    iftop
    nethogs
    nmon
    iotop
    sysstat
    tcpdump
    atool
    rsync
    gnutls
    bind
    mkpasswd
    openssl
    file
    lshw
    lm_sensors
    inxi
    s-tui
    stress-ng
    tpacpi-bat
    tlp
    cpufrequtils
    msr-tools
    sshfs
    vdpauinfo
    dmidecode
    fwupd
    ncdu
    pass encfs 
    ripgrep-all
    networkmanager
    wirelesstools
    blueman
    bluez
    bluez-tools
    mtr
  ];

}
