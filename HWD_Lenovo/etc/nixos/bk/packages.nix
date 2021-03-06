{ config, pkgs, ... }:

#  let
#    unstableTarball =
#      fetchTarball
#        https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
#  in

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{

#  nixpkgs.config = {
#    packageOverrides = pkgs: {
#      unstable = import unstableTarball {
#        config = config.nixpkgs.config;
#      };
#    };
#  };

  nixpkgs.config.packageOverrides = pkgs: {
    nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
      inherit pkgs;
    };
  };

  environment = {
    etc."sysconfig/lm_sensors".text = ''
    # Generated by sensors-detect on Tue Aug  7 10:54:09 2018
    # This file is sourced by /etc/init.d/lm_sensors and defines the modules to
    # be loaded/unloaded.
    #
    # The format of this file is a shell script that simply defines variables:
    # HWMON_MODULES for hardware monitoring driver modules, and optionally
    # BUS_MODULES for any required bus driver module (for example for I2C or SPI).

    HWMON_MODULES="coretemp"
    '';

    systemPackages = with pkgs; [
      nix-index
      nix-review
      nixpkgs-fmt
      nix-prefetch-github
      (lowPrio nix-prefetch-git)
      nix-prefetch-scripts
      nixFlakes
      unstable.virt-manager
      unstable.virt-viewer
  #    undervolt
      acpica-tools
      patchelf
      binutils
      cryptsetup
      dstat
      gptfdisk
      mc
      traceroute
      whois
      which
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
  #    tlp
      cpufrequtils
      msr-tools
      nvtop
      sshfs
      vdpauinfo
      dmidecode
      fwupd
      fwupdate
      ncdu
      pass encfs 
      linuxPackages.perf
      ripgrep-all
      networkmanager
      wirelesstools
  #    blueman
  #    (lowPrio bluez)
  #    bluez-tools
      mtr
      nftables
      psmisc
      ripgrep-all
      tcpdump
      ethtool
      bmon
      (lowPrio inetutils)
      socat
      iptables
      nload
      nvme-cli
      ncurses
    ];
  };
}
