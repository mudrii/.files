{ config, lib, pkgs, callPackage, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{

  hardware = {
    opengl.driSupport32Bit = true;
  };
 
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
        xterm.enable = false;
      };

      displayManager = {
        defaultSession = "none+i3";        
        autoLogin.enable = false;

        lightdm = {
          enable = true;
          greeter.enable = true;
#          autoLogin.enable = false;
#          greeter.enable = false;
#          autoLogin.enable = true;
#          autoLogin.user = "irutsu";
        };
      };

      windowManager = {
        i3.enable = true;
        i3.package = pkgs.i3-gaps;
        i3.extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3lock #default i3 screen locker
          i3status-rust
          i3-gaps
          i3lock-fancy
          xautolock
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
