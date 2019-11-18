{ config, lib, pkgs, callPackage, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{
#  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
#  environment.systemPackages = with pkgs; [ xorg.xbacklight ];

  hardware = {
    opengl.driSupport32Bit = true;
    nvidia = {
      optimus_prime = {                                             
        enable = true;                                                              
        intelBusId = "PCI:0:2:0";                                                   
        nvidiaBusId = "PCI:1:0:0";                                                  
      };
      modesetting.enable = true;
    };
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
#      videoDrivers = [ "intel" ];
      videoDrivers = [ "nvidia" ];

      layout = "us";
      xkbOptions = "eurosign:e";
      libinput = {
        enable = true;
        disableWhileTyping = true;
        naturalScrolling = true;
        additionalOptions = ''
          Option "PalmDetection" "True"
        '';
      };
      desktopManager = {
        default = "none";
        xterm.enable = false;
      };
      displayManager = {
#        setupCommands = ''
#          ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0 
#          ${pkgs.xorg.xrandr}/bin/xrandr --auto
#          '';
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
