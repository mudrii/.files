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

    dbus = {
      enable = true; 
      packages = [ pkgs.fwupd ];
    };

    locate = {
      enable = true;
      locate = pkgs.mlocate;
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
