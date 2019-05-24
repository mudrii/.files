{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./packages.nix
      ./fonts.nix
      ./aliases.nix
      ./users.nix
      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home.nix
    ];

  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda";
  networking.hostName = "nixos";

  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];
  networking.enableIPv6 = false;
  networking.nat.enable = true;
  networking.nat.internalInterfaces = ["ve-+"];
  networking.nat.externalInterface = "enp0s3";

  time.timeZone = "Asia/Singapore";

  virtualisation.docker.enable = true;

  programs.fish.enable = true;

  programs.vim.defaultEditor = true;

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";

  users.mutableUsers = false;

  programs.bash.enableCompletion = true;
  security.sudo.wheelNeedsPassword = false;

  system.stateVersion = "19.03";

  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;

  swapDevices = [ { device = "/swapfile"; } ];
}