{ config, lib, pkgs, callPackage, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{

  services = {
    udev = {
      path = [ pkgs.coreutils ];
      extraRules = ''
        ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video %S%p/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w %S%p/brightness"
      '';
  };
 
    xserver = {
      enable = true;
#      autorun = false;
      videoDrivers = [ "intel" ];

      layout = "us";
      xkbOptions = "eurosign:e";
      libinput.enable = true;
      desktopManager = {
        default = "none";
        xterm.enable = false;
      };
      displayManager = {
        lightdm = {
          enable = true;
          greeter.enable = false;
          autoLogin.enable = true;
          autoLogin.user = "andre";
        };
      };

      windowManager = {
        default = "i3";
        i3.enable = true;
        i3.package = pkgs.i3-gaps;
        i3.extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3lock #default i3 screen locker
          i3status-rust
          i3-gaps
          rofi
          numlockx
#          conky          
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
