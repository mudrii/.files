{ config, pkgs, ... }:

#  let
#    unstableTarball =
#      fetchTarball
#        https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
#  in

let
  unstable = import <unstable> {};
in

{
  
#  nixpkgs.config = {
#    packageOverrides = pkgs: {
#      unstable = import unstableTarball {
#        config = config.nixpkgs.config;
#      };
#    };
#  };

  environment.systemPackages = with pkgs; [
    fish
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
    cpufrequtils
    msr-tools
    nvtop
    sshfs
    vdpauinfo

#    networkmanager

  ];

}
