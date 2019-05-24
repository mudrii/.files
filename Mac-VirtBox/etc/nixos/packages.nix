{ config, pkgs, ... }:

{
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
    python37Packages.pygments
    python37Packages.pygments-markdown-lexer
    python37Packages.xstatic-pygments
  ];
}