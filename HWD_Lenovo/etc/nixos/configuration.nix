# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, options, pkgs, lib, callPackage, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{

  /*
    nixpkgs.config.packageOverrides = pkgs: {
      nur = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {
        inherit pkgs;
      };
    };  
  */

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      # "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home-manager.nix
      # ./containers.nix      
    ];

  /*
    imports = [
      ./containers/gcpdrgn.nix
      ./containers/gcpsndp.nix
      ./containers/gcpion.nix
      ./containers/awsndp.nix
      ./containers/awsion.nix
    ];

    containers = {
      gcpdrgn.autoStart = false;
      gcpsndp.autoStart = false;
      gcpion.autoStart = true;
      awsndp.autoStart = false;
      awsion.autoStart = true;
    };
    */


  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        enableCryptodisk = true;
        # enable = true;
        # devices = [ "nodev" ];
        # efiInstallAsRemovable = true;
        # efiSupport = true;
        # useOSProber = true;
      };
    };

    supportedFilesystems = [ "ntfs" ];
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = [ "nouveau" ];
    # extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
    # kernelParams = [ "nvidia-drm.modeset=1" ];
    cleanTmpDir = true;
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
    # enableAllFirmware = true;

    sane = {
      enable = true;
      extraBackends = with pkgs; [ hplipWithPlugin ];
    };

    bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };

    opengl = {
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      # nvidiaPersistenced = false;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  networking = {
    hostName = "p53-nixos";
    networkmanager.enable = true;
    enableIPv6 = false;
    useDHCP = false;
    interfaces.enp0s31f6.useDHCP = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    # Enables wireless support via wpa_supplicant.
    # wireless.enable = true;  
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    /*
    nat = {
      enable = true;
      internalInterfaces = ["ve-+"];
      externalInterface = "enp0s31f6";
    };
    */

    # Open ports in the firewall.
    firewall = {
      # Or disable the firewall altogether.
      enable = true;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ 53 ];
      allowPing = true;
      trustedInterfaces = [ "docker0" "virbr0" ];
    };
  };

  # TPM has hardware RNG
  security = {
    rngd.enable = true;

    sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };

    # Finger Print Auth //Not working 100% yet with fprint
    /*
    pam.services = {
      login.fprintAuth = true;
      xautolock.fprintAuth = true;
    };
    */
  };

  /*  
    powerManagement = {
      enable = true;
      powertop.enable = true;
      cpuFreqGovernor =  "ondemand"; # "powersave", "performance" 
      cpuFreqGovernor =  "powersave"; # "ondemand", "performance" 
    };
  */

  /*
  fileSystems."/home/mudrii/mnt/usb" = { 
    device = "/dev/sda1";
    fsType = "ntfs"; 
    options = [ "rw" "uid=1000"];
  };
  */

  programs = {
    seahorse.enable = true;
    vim.defaultEditor = true;
    mtr.enable = true;
    ssh.startAgent = false;

    chromium = {
      enable = true;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    bash = {
      enableCompletion = true;
      # shellInit = "neofetch";
      promptInit = ''
        PS1="\n\[\033[1;32m\]\e[0;31m[\[\e]0;\u@\h: \w\a\]\e[01;32m\u@\[\e[1;34m\]\h:\[\e[01;36m\]\w\[\e[01;32m\]\e[0;31m]\[\033[0m\]\$(__git_ps1)\[\e[01;32m\]\$\[\033[0m\] "
      '';
    };

    fish = {
      enable = true;
      vendor = {
        completions.enable = true;
        config.enable = true;
      };
      # shellInit = "neofetch";
      # functions = { fish_greeting = ""; };
      /*
      promptInit = ''
        any-nix-shell fish --info-right | source
      '';
      */
    };

    nano.nanorc = ''
      unset backup
      set nonewlines
      set nowrap
      set tabstospaces
      set tabsize 4
      set constantshow
    '';
  };

  # List services that you want to enable:
  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = true;
    };

    libvirtd = {
      enable = true;
    };
    /*
    lxd = {
      enable = true;
    };
    */
    /*
    virtualbox = {
      host.enable = true;
      host.enableExtensionPack = true;
    };
    */
  };

  # Example how to use pam
  /*
  pam.services = [
    { name = "gnome_keyring"
      text = ''
        auth     optional    ${gnome3.gnome_keyring}/lib/security/pam_gnome_keyring.so
        session  optional    ${gnome3.gnome_keyring}/lib/security/pam_gnome_keyring.so auto_start
        password  optional    ${gnome3.gnome_keyring}/lib/security/pam_gnome_keyring.so
      '';
    }
  ];
  */

  services = {
    # localtime.enable = true;
    urxvtd.enable = true;
    blueman.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    sysstat.enable = true;
    gnome3.gnome-keyring.enable = true;
    fail2ban.enable = true;
    emacs.enable = true;
    
    /*
    # Finger Print unlock login
    fprintd = {
      enable = true;
      package = unstable.pkgs.fprintd;
    };
    */

    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };

    /*
    # YubiKey support
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];
    */

    thinkfan = {
      enable = true;
      /* levels = ''
        (0,     0,      65)
        (1,     58,     70)
        (2,     60,     71)
        (3,     62,     73)
        (6,     66,     75)
        (7,     70,     95)
        (127,   90,     32767)
      ''; */
    };

    undervolt = {
      enable = true;
      package = pkgs.undervolt;
      temp = 97;
      coreOffset = -125;
    };

    # Power button invokes suspend, not shutdown.
    logind = {
      extraConfig = "HandlePowerKey=suspend";
      lidSwitch = "suspend";
    };

    # Generate thermal-conf.xml
    # git clone https://github.com/intel/dptfxtract.git
    # cd dptfxtract
    # sudo acpidump > acpi.out
    # acpixtract -a acpi.out
    # sudo ./dptfxtract-static *.dat

    thermald = {
      enable = true;
      configFile = builtins.toFile "thermal-conf.xml" ''
         <!-- BEGIN --> 
         <ThermalConfiguration> 
         <Platform>
                <Name> Auto generated </Name>
                <ProductName>Standard PC (Q35 + ICH9, 2009)</ProductName>
                <Preference>QUIET</Preference>
                <ThermalZones>
                        <ThermalZone>
                                <Type>auto_zone_0</Type>
                                <TripPoints>
                                        <TripPoint>
                                                <SensorType>B0D4</SensorType>
                                                <Temperature>100000</Temperature>
                                                <Type>Passive</Type>
                                                <CoolingDevice>
                                                        <Type>B0D4</Type>
                                                        <SamplingPeriod>0</SamplingPeriod>
                                                </CoolingDevice>
                                        </TripPoint>
                                </TripPoints>
                        </ThermalZone>
                        <ThermalZone>
                                <Type>auto_zone_1</Type>
                                <TripPoints>
                                        <TripPoint>
                                                <SensorType>SEN1</SensorType>
                                                <Temperature>99000</Temperature>
                                                <Type>Passive</Type>
                                                <CoolingDevice>
                                                        <Type>B0D4</Type>
                                                        <SamplingPeriod>1</SamplingPeriod>
                                                </CoolingDevice>
                                        </TripPoint>
                                </TripPoints>
                        </ThermalZone>
                </ThermalZones>
        </Platform>
        </ThermalConfiguration>
        <!-- END -->
      '';
    };

    chrony = {
      enable = true;
      servers = [
        "0.sg.pool.ntp.org"
        "1.sg.pool.ntp.org"
        "2.sg.pool.ntp.org"
        "3.sg.pool.ntp.org"
      ];
    };

    /*    
    timesyncd = {
      enable = true;
      servers = [ 
        "0.sg.pool.ntp.org" 
        "1.sg.pool.ntp.org" 
        "2.sg.pool.ntp.org" 
        "3.sg.pool.ntp.org"
      ];
    };
    */

    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
      challengeResponseAuthentication = false;
    };

    # Enable CUPS to print documents.
    printing = {
      enable = true;
      # drivers = [ unstable.pkgs.epson-escpr ];
      drivers = with pkgs; [ unstable.epson-escpr ];
    };

    avahi = {
      enable = true;
      hostName = config.networking.hostName;
      ipv4 = true;
      nssmdns = true;
      publish = {
        enable = true;
        userServices = true;
      };
    };

    tlp = {
      enable = true;
      # extraConfig = ''
      settings = {
        # Detailked info can be found https://linrunner.de/tlp/settings/index.html

        # Disables builtin radio devices on boot:
        #   bluetooth
        #   wifi – Wireless LAN (Wi-Fi)
        #   wwan – Wireless Wide Area Network (3G/UMTS, 4G/LTE, 5G)
        # DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wifi"

        # When a LAN, Wi-Fi or WWAN connection has been established, the stated radio devices are disabled:
        #   bluetooth
        #   wifi – Wireless LAN
        #   wwan – Wireless Wide Area Network (3G/UMTS, 4G/LTE, 5G)
        # DEVICES_TO_DISABLE_ON_LAN_CONNECT="wifi wwan"
        # DEVICES_TO_DISABLE_ON_WIFI_CONNECT="wwan"
        # DEVICES_TO_DISABLE_ON_WWAN_CONNECT="wifi"

        # When a LAN, Wi-Fi, WWAN connection has been disconnected, the stated radio devices are enabled.
        # DEVICES_TO_ENABLE_ON_LAN_DISCONNECT="wifi wwan"
        # DEVICES_TO_ENABLE_ON_WIFI_DISCONNECT=""
        # DEVICES_TO_ENABLE_ON_WWAN_DISCONNECT=""

        # Set battery charge thresholds for main battery (BAT0) and auxiliary/Ultrabay battery (BAT1). Values are given as a percentage of the full capacity. A value of 0 is translated to the hardware defaults 96/100%.        
        START_CHARGE_THRESH_BAT0=45;
        STOP_CHARGE_THRESH_BAT0=75;

        # Control battery feature drivers:
        NATACPI_ENABLE=1;
        TPACPI_ENABLE=1;
        TPSMAPI_ENABLE=1;

        # Defines the disk devices the following parameters are effective for. Multiple devices are separated with blanks.
        DISK_DEVICES="nvme0n1 nvme1n1";

        # Set the “Advanced Power Management Level”. Possible values range between 1 and 255.
        #  1 – max power saving / minimum performance – Important: this setting may lead to increased disk drive wear and tear because of excessive read-write head unloading (recognizable from the clicking noises)
        #  128 – compromise between power saving and wear (TLP standard setting on battery)
        #  192 – prevents excessive head unloading of some HDDs
        #  254 – minimum power saving / max performance (TLP standard setting on AC)
        #  255 – disable APM (not supported by some disk models)
        #  keep – special value to skip this setting for the particular disk (synonym: _)
        DISK_APM_LEVEL_ON_AC="254 254";
        DISK_APM_LEVEL_ON_BAT="128 128";

        # Set the min/max/turbo frequency for the Intel GPU. Possible values depend on your hardware. See the output of tlp-stat -g for available frequencies.
        # INTEL_GPU_MIN_FREQ_ON_AC=0
        # INTEL_GPU_MIN_FREQ_ON_BAT=0
        # INTEL_GPU_MAX_FREQ_ON_AC=0
        # INTEL_GPU_MAX_FREQ_ON_BAT=0
        # INTEL_GPU_BOOST_FREQ_ON_AC=0
        # INTEL_GPU_BOOST_FREQ_ON_BAT=0

        # Selects the CPU scaling governor for automatic frequency scaling.
        # For Intel Core i 2nd gen. (“Sandy Bridge”) or newer Intel CPUs. Supported governors are:
        #  powersave – recommended (kernel default)
        #  performance
        # CPU_SCALING_GOVERNOR_ON_AC=powersave;
        # CPU_SCALING_GOVERNOR_ON_BAT=powersave;

        # Set Intel CPU energy/performance policy HWP.EPP. Possible values are
        #  performance
        #  balance_performance
        #  default
        #  balance_power
        #  power
        # for tlp-stat Version 1.3 and higher 'tlp-stat -p'
        # CPU_ENERGY_PERF_POLICY_ON_AC=balance_performance;
        # CPU_ENERGY_PERF_POLICY_ON_BAT=power;

        # Set Intel CPU energy/performance policy HWP.EPP. Possible values are
        #   performance
        #   balance_performance
        #   default
        #   balance_power
        #   power
        # Version 1.2.2 and lower For version 1.3 and higher this parameter is replaced by CPU_ENERGY_PERF_POLICY_ON_AC/BAT
        # CPU_HWP_ON_AC=balance_performance;
        # CPU_HWP_ON_BAT=power;

        # Define the min/max P-state for Intel Core i processors. Values are stated as a percentage (0..100%) of the total available processor performance.
        CPU_MIN_PERF_ON_AC=0;
        CPU_MAX_PERF_ON_AC=100;
        CPU_MIN_PERF_ON_BAT=0;
        CPU_MAX_PERF_ON_BAT=30;

        # Disable CPU “turbo boost” (Intel) or “turbo core” (AMD) feature (0 = disable / 1 = allow).
        CPU_BOOST_ON_AC=1;
        CPU_BOOST_ON_BAT=0;

        # Minimize number of used CPU cores/hyper-threads under light load conditions (1 = enabled, 0 = disabled). Depends on kernel and processor model.
        SCHED_POWERSAVE_ON_AC=0;
        SCHED_POWERSAVE_ON_BAT=1;

        # Set Intel CPU energy/performance policy EPB. Possible values are (in order of increasing power saving):
        #   performance
        #   balance-performance
        #   default (deprecated: normal)
        #   balance-power
        #   power (deprecated: powersave)
        # Version 1.2.2 and lower For version 1.3 and higher this parameter is replaced by CPU_ENERGY_PERF_POLICY_ON_AC/BAT
        # ENERGY_PERF_POLICY_ON_AC=balance-performance;
        # ENERGY_PERF_POLICY_ON_BAT=power;

        # Timeout (in seconds) for the audio power saving mode (supports Intel HDA, AC97). A value of 0 disables power save.
        SOUND_POWER_SAVE_ON_AC=0;
        SOUND_POWER_SAVE_ON_BAT=1;

        # Controls runtime power management for PCIe devices.
        # RUNTIME_PM_ON_AC=on;
        # RUNTIME_PM_ON_BAT=auto;

        # Exclude PCIe devices assigned to listed drivers from runtime power management. Use tlp-stat -e to lookup the drivers (in parentheses at the end of each output line).
        # RUNTIME_PM_DRIVER_BLACKLIST="mei_me nouveau nvidia pcieport radeon"

        # Sets PCIe ASPM power saving mode. Possible values:
        #    default – recommended
        #    performance
        #    powersave
        #    powersupersave
        # PCIE_ASPM_ON_AC=default;
        # PCIE_ASPM_ON_BAT=default;
      #'';
      };
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
      # autorun = false;
      # videoDrivers = [ "intel" ];
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
        xterm.enable = false;
      };

      displayManager = {
        /*
        setupCommands = ''
          ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0 
          ${pkgs.xorg.xrandr}/bin/xrandr --auto
        '';
        */
        defaultSession = "none+i3";
        autoLogin.enable = true;
        autoLogin.user = "mudrii";

        lightdm = {
          enable = true;
          greeter.enable = false;
        };
      };

      windowManager = {
        i3.enable = true;
        i3.package = pkgs.i3-gaps;
        i3.extraPackages = with pkgs; [
          dmenu #application launcher most people use
          i3lock #default i3 screen locker
          # i3status # gives you the default i3 status bar
          # i3blocks #if you are planning on using i3blocks over i3status
          unstable.i3status-rust
          i3-gaps
          i3lock-fancy
          xautolock
          rofi
          numlockx
          # conky
          # rxvt_unicode
          rxvt_unicode-with-plugins
          (lowPrio urxvt_perls)
          (lowPrio urxvt_font_size)
          acpilight
          glxinfo
          pavucontrol
          networkmanager_dmenu
          arandr
          escrotum
          obs-studio
          libva-utils
        ];
      };
    };
  };

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    supportedLocales = [ "en_US.UTF-8/UTF-8" ];
  };

  console = {
    # font = "Powerline";
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;

    fonts = with pkgs; [
      corefonts
      inconsolata
      unifont
      ubuntu_font_family
      symbola
      nerdfonts
      freefont_ttf
      powerline-fonts
      font-awesome
      font-awesome_4
      dejavu_fonts
      google-fonts
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts
      dina-font
      proggyfonts
      # emojione
      twemoji-color-font
      mononoki
    ];
  };

  # Enable sound.
  sound.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  #  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 
  #  environment.systemPackages = with pkgs; [ xorg.xbacklight ];

  environment = {
    etc."sysconfig/lm_sensors".text = ''
      # Generated by sensors-detect on Tue Aug  7 10:54:09 2018
      # This file is sourced by /etc/init.d/lm_sensors and defines the modules to
      # be loaded/unloaded.
      #
      # The format of this file is a shell script that simply defines variables:
      # HWMON_MODULES for hardware monitoring driver modules, and optionally
      # BUS_MODULES for any required bus driver module (for example for I2C or SPI).

      HWMON_MODULES="coretemp"
    '';

    # YubiKey SSH and GPG support    
    /*    
      shellInit = ''
        export GPG_TTY="$(tty)"
        gpg-connect-agent /bye
        export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
    #   export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
      '';
    */
    variables = {
      # Preferred applications
      EDITOR = "vim";
      BROWSER = "qutebrowser";
    };

    systemPackages = with pkgs; [
      chkrootkit
      lynis
      nixfmt
      nix-index
      nixpkgs-fmt
      nixpkgs-lint
      nix-prefetch
      nix-du
      nix-linter
      nixpkgs-review
      nixpkgs-pytools
      unstable.nix-simple-deploy
      niv
      graphviz
      (lowPrio nix-prefetch-git)
      nix-prefetch-scripts
      unstable.virt-manager
      unstable.virt-viewer
      # undervolt
      acpica-tools
      patchelf
      binutils
      cryptsetup
      dstat
      gptfdisk
      parted
      mc
      nnn
      # vifm
      lf
      trash-cli
      traceroute
      whois
      which
      nmap
      wget
      neovim
      # micro
      commonsCompress
      libarchive
      archiver
      # p7zip
      unzip
      unrar
      unstable.cpu-x
      lsof
      acpi
      pciutils
      usbutils
      powertop
      tree
      jdupes
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
      lshw
      lm_sensors
      inxi
      s-tui
      stress-ng
      tpacpi-bat
      # tlp
      cpufrequtils
      msr-tools
      nvtop
      sshfs
      vdpauinfo
      dmidecode
      fwupd
      # fwupdate
      ncdu
      smartmontools
      pass
      encfs
      linuxPackages.perf
      networkmanager
      wirelesstools
      # blueman
      # (lowPrio bluez)
      # bluez-tools
      mtr
      nftables
      psmisc
      ripgrep-all
      ripgrep
      du-dust
      exa
      tcpdump
      ethtool
      bmon
      (lowPrio inetutils)
      socat
      iptables
      iperf
      nload
      nvme-cli
      ncurses
      protonvpn-cli
      protonvpn-gui
      openvpn
      wireguard
      unstable.gopass
    ];

    shellAliases = {
      a = "aws";
      ans = "ansible";
      ansp = "ansible-paybook";
      ansv = "ansible-vault";
      ccat = "pygmentize -f terminal256 -g -P style=monokai";
      cp = "cp -i";
      diff = "diff --color=auto";
      dmesg = "dmesg --color=always | lless";
      egrep = "egrep --color=auto";
      fgrep = "fgrep --color=auto";
      g = "gcloud";
      grep = "grep --color=auto";
      gadcm = "git add -A; and git commit";
      gad = "git add .";
      gcm = "git commit";
      gdf = "git diff";
      gl = "git log";
      glg = "git log --color --graph --pretty --oneline";
      gpl = "git pull";
      gps = "git push";
      gst = "git status";
      k = "kubectl";
      kns = "kubens";
      ktx = "kubectx";
      la = "exa -alg --group-directories-first -s=type --icons";
      # la="ls -lha --color=auto --group-directories-first";
      lless = "set -gx LESSOPEN '|pygmentize -f terminal256 -g -P style=monokai %s' && set -gx LESS '-R' && less -m -g -i -J -u -Q";
      # ll="ls -lah";
      # ls="ls --color=auto";
      ll = "exa -la";
      ls = "exa";
      mv = "mv -i";
      nixcl = "sudo nix-store --optimise -v && sudo nix-collect-garbage -d";
      nixup = "sudo nix-channel --update && sudo nixos-rebuild switch";
      p = "python";
      ping = "ping -c3";
      ps = "ps -ef";
      pvpn = "sudo protonvpn";
      rm = "rm -i";
      rmf = "rm -rf";
      sudo = "sudo -i";
      suf = "su --shell=/usr/bin/fish";
      t = "terraform";
      vdir = "vdir --color=auto";
    };
  };

  /*  
    nixpkgs.config = {
      packageOverrides = pkgs: {
        unstable = import unstableTarball {
          config = config.nixpkgs.config;
        };
      };
    };
  */

  users = {
    mutableUsers = false;

    users.mudrii = {
      isNormalUser = true;
      home = "/home/mudrii";
      shell = pkgs.fish;
      description = "mudrii";
      extraGroups = [ "wheel" "docker" "audio" "video" "tty" "input" "networkmanager" "libvirtd" ];
      # mkpasswd -m sha-512 password
      hashedPassword = "$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzc7Xx3FVqz2cV1qzkPFV9DmfXCvS98HWs6nzcZ+1zMQDpZUuSGY2hV8UyXgiitogLl3BTaKztvBmrzh3FeeRHYDX39eR+tvcL7mY+qIqUwyCrDcrXC+KHuMVcYWJPJBx+enlId/ZbBgzz4SpBTOVANGDv1AhkNhl1CDfSrIOSdoRdhQpcYqtjwmiy/giGhfwNwtTGFVJNXG5CZEtyKRyjN43dX12/g6eEThLpjAS7QxF8pCzLh754rjD4V4Qmg/t+BawOglSyNaqEBtdyd0xiI353hzdNG4U+6V3yPYKSdkZzHaGACwCNMKSfrF7IrIQtUc5d9b0H+XEjpKzPWaZWXg9Io/vKhSTK4brXeAnsck4kbWYj1RiU6noAZNZRleM8fMO6UdwzLZzrxGMOBFSSZHHUlgLEjadkc2kmGwvXx5bmEUXMCAb7jUIzv+TEoOcJfCj8xUGxCQtlk9kIguV0l8BWY0B6iwyNn8XM7taLdfIEMACkuD9v0y7SCBWRm6DL3PoVijnGX+g3ox1bGvx/9+4h1HbPH3POj5/C2Vh6kWtXFKTVHSrU4m8HsV94slD4ILTyfJxGWgL2TzjSJz3eKUlVNe9r1Pv14CDb2XaN4lGGxWV2aYDYwCwNaZyJTOXi/9tiflfmcHIiYRoABrss6nssfL2f6fNa0hm0ZAUClw== mudrii@arch" ];

      packages = with pkgs; [
        alacritty
        fish
        neofetch
        ranger
        poppler_utils
        elinks
        mediainfo
        w3m
        ffmpeg-full
        ffmpegthumbnailer
        mupdf
        tmux
        screen
        # keychain
        unstable.minio-client
        unstable.google-cloud-sdk-gce
        unstable.awscli
        unstable.pulumi-bin
        unstable.gitAndTools.gitFull
        unstable.gitAndTools.git-hub
        unstable.gitAndTools.gh
        unstable.git-lfs
        unstable.terraform_0_13
        unstable.terraform-ls
        #unstable.terraform-lsp
        unstable.tflint
        unstable.kubernetes
        kubernetes-helm
        unstable.kind
        unstable.go
        unstable.xmind
        unstable.zoom-us
        unstable.teams
        signal-desktop
        kubectx
        dep
        /*
        (unstable.terraform.withPlugins(p: with p; [
          archive
          aws
          external
          google
          helm
          kubernetes
          local
          null
          random
          template
        ]))
        */
        # (lowPrio unstable.python38Full)
        python38Full
        # python37Full
        (
          python3.withPackages (
            ps: with ps; [
              # poetry
              pip
              powerline
              pygments
              pygments-markdown-lexer
              xstatic-pygments
              pylint
              pandas
              numpy
              scipy
              matplotlib
              jupyter
            ]
          )
        )
        # python37Packages.pip
        # unstable.python37Packages.virtualenv
        # python37Packages.powerline
        # python37Packages.pygments
        # python37Packages.pycuda
        aspell
        aspellDicts.en
        asciinema
        highlight
        jq
        lorri
        unstable.direnv
        psensor
        firefox
        chromium
        qutebrowser
        brave
        unstable.vscode
        unstable.sublime3
        slack
        vlc
        filezilla
        gpicview
        home-manager
        fzf
        bat
        fd
        skypeforlinux
        zathura
        mpv
        feh
        weechat
        gcc
        gnumake
        gnupg
        pinentry-curses
        pinentry-qt
        paperkey
        pam_u2f
        libu2f-host
        libu2f-server
        yubikey-manager
        yubico-piv-tool
        yubikey-manager-qt
        yubikey-personalization
        yubikey-personalization-gui
        yubioath-desktop
        gpa
        imagemagick
        spotify
        bookworm
        ltrace
        /*
        (unstable.tor-browser-bundle-bin.override {
          mediaSupport = true;
          pulseaudioSupport = true;
        })
        */
        unstable.keepassxc
        openconnect_openssl
        networkmanager-openconnect
        unstable.element-desktop
        unstable.ansible
        graphviz
        scrcpy
        unstable.pcmanfm
        unstable.mucommander
        unstable.hexchat
        unstable.grsync
        unstable.luckybackup
      ];
    };
  };

  nix = {
    #package = pkgs.nixUnstable;
    useSandbox = true;
    autoOptimiseStore = true;
    readOnlyStore = false;
    allowedUsers = [ "@wheel" "root" "mudrii" ];
    trustedUsers = [ "@wheel" "root" "mudrii" ];

    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
      # preallocate-contents = false
      # experimental-features = nix-command flakes
      '';

    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d --max-freed $((64 * 1024**3))";
      # dates = "Mon *-*-* 06:00:00";      
    };

    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
    
  };

  nixpkgs.config = {
    pulseaudio = true;
    allowBroken = true;
    allowUnfree = true;
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system = {
    stateVersion = "20.09"; # Did you read the comment?
    autoUpgrade = {
      enable = true;
      dates = "weekly";
      allowReboot = false;
      # dates = "Sun *-*-* 04:00:00";
    };
  };

}
