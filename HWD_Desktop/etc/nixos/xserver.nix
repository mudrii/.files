{ config, lib, pkgs, callPackage, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{
#  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
#  environment.systemPackages = with pkgs; [ xorg.xbacklight ];

  services = {
    xserver = {
      enable = true;
#      autorun = false;
      videoDrivers = [ "nvidia" ];

      layout = "us";
      xkbOptions = "eurosign:e";
      desktopManager = {
        default = "none";
        xterm.enable = false;
      };
      displayManager = {
        lightdm = {
          enable = true;
          greeter.enable = false;
          autoLogin.enable = true;
          autoLogin.user = "mudrii";
        };
      };

      windowManager = {
        default = "i3";
        i3.enable = true;
        i3.package = pkgs.i3-gaps;
        i3.extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3lock #default i3 screen locker
#          i3status # gives you the default i3 status bar
#          i3blocks #if you are planning on using i3blocks over i3status
          i3status-rust
          i3-gaps
          i3lock-fancy
          rofi
          numlockx
#          conky
#          rxvt_unicode
          rxvt_unicode-with-plugins
          urxvt_perls
          urxvt_font_size
          acpilight
          glxinfo
          pavucontrol
          networkmanager_dmenu
          arandr
          escrotum
        ];
      };
    };
  };
}
