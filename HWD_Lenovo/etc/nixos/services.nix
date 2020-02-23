{ config, options, pkgs, lib, callPackage, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{
  services = {
#    localtime.enable = true;
    blueman.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    sysstat.enable = true;  
    timesyncd = {
      enable = true;
      servers = [ "0.sg.pool.ntp.org" "1.sg.pool.ntp.org" "2.sg.pool.ntp.org" "3.sg.pool.ntp.org" ];
    };

    openssh = { 
      enable = true;
      permitRootLogin = "no";
    };
  
    # Enable CUPS to print documents.
    printing = {
      enable = true;
      drivers = [ unstable.pkgs.epson-escpr ];
    };
  
    avahi = {
      enable = true;
      nssmdns = true;
    };

    tlp = {
      enable = true;
      extraConfig = ''
  #     DEVICES_TO_DISABLE_ON_STARTUP="bluetooth"
        START_CHARGE_THRESH_BAT0=60
        STOP_CHARGE_THRESH_BAT0=80
        CPU_SCALING_GOVERNOR_ON_AC=powersave
        CPU_SCALING_GOVERNOR_ON_BAT=powersave
        ENERGY_PERF_POLICY_ON_AC=balance-performance
        ENERGY_PERF_POLICY_ON_BAT=power
      '';
    };
  
    udev = {
      path = [ pkgs.coreutils ];
      extraRules = ''
        ACTION=="add", SUBSYSTEM=="backlight", RUN+="${pkgs.coreutils}/bin/chgrp video %S%p/brightness", RUN+="${pkgs.coreutils}/bin/chmod g+w %S%p/brightness"
      '';
    };
 
    dbus = {
      enable = true; 
      packages = [ pkgs.fwupd ];
    };

    locate = {
      enable = true;
      locate = unstable.pkgs.mlocate;
      localuser = null; # mlocate does not support this option so it must be null
      # interval = "daily";
      interval = "hourly";
      pruneNames = [
        ".git"
        "cache"
        ".cache"
        ".cpcache"
        ".aot_cache"
        ".boot"
        "node_modules"
        "USB"
      ];

      prunePaths = options.services.locate.prunePaths.default ++ [
        "/dev"
        "/lost+found"
        "/nix/var"
        "/proc"
        "/run"
        "/sys"
        "/usr/tmp"
      ];
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
        naturalScrolling = false;
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
