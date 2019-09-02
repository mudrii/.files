{ config, pkgs, ... }:

let
  unstableTarball =
    fetchTarball
      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
in

{

  nixpkgs.config = {
    packageOverrides = pkgs: {
      unstable = import unstableTarball {
        config = config.nixpkgs.config;
      };
    };
  };

  environment.systemPackages = with pkgs; [
    fish
    wget
    vim
    neovim
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
    python37Packages.pygments
    python37Packages.pygments-markdown-lexer
    python37Packages.xstatic-pygments
  ];
}
