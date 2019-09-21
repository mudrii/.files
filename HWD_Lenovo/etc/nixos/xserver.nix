{ config, lib, pkgs, callPackage, ... }:

{
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
#  environment.systemPackages = with pkgs; [ xorg.xbacklight ];

#  hardware.nvidia.modesetting.enable = true;                                    
  hardware.nvidia.optimus_prime = {                                             
    enable = true;                                                              
    intelBusId = "PCI:0:2:0";                                                   
    nvidiaBusId = "PCI:1:0:0";                                                  
  };
 
#  services.udev.path = pkgs.coreutils # for chgrp

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
      libinput.enable = true;
      desktopManager = {
        default = "none";
        xterm.enable = false;
      };
      displayManager.lightdm = {
        enable = true;
        greeter.enable = false;
        autoLogin.enable = true;
        autoLogin.user = "mudrii";
#        enable = lib.mkForce false; 
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
          rofi
#          conky
#          rxvt_unicode
          rxvt_unicode-with-plugins
          urxvt_perls
          urxvt_font_size
          acpilight
#          xorg.xbacklight
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
