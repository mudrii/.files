# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, options, pkgs, lib, callPackage, ... }:

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
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
#      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home-manager.nix
#      ./containers.nix      
    ];

 boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub.enableCryptodisk = true;
    };
  
    kernelPackages = pkgs.linuxPackages_latest;
    blacklistedKernelModules = ["nouveau"];
#    extraModulePackages = with config.boot.kernelPackages; [ wireguard ];
#    kernelParams = [ "nvidia-drm.modeset=1" ];
    cleanTmpDir = true;
  };

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
#    enableAllFirmware = true;

    bluetooth = {
      enable = true;
      package = pkgs.bluezFull;
    };

    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };

    opengl.driSupport32Bit = true;

    nvidia = {
      modesetting.enable = true;
      optimus_prime = {                                             
        enable = true;                                                              
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
#    wireless.enable = true;  
  #  Configure network proxy if necessary
#    proxy.default = "http://user:password@proxy:port/";
#    proxy.noProxy = "127.0.0.1,localhost,internal.domain";

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
  };

/*  
  powerManagement = {
    enable = true;
#    powertop.enable = true;
#    cpuFreqGovernor =  "ondemand"; # "powersave", "performance" 
#    cpuFreqGovernor =  "powersave"; # "ondemand", "performance" 
  };
*/

  programs = {
    seahorse.enable = true;
    vim.defaultEditor = true;
    mtr.enable = true;
    
    ssh.startAgent = false;    
#    ssh.startAgent = true;

    chromium = {
      enable = true;
    };

    gnupg.agent = { 
      enable = true; 
      enableSSHSupport = true; 
    };

    bash = {
      enableCompletion = true;
#      shellInit = "neofetch";
      promptInit = ''
          PS1="\n\[\033[1;32m\]\e[0;31m[\[\e]0;\u@\h: \w\a\]\e[01;32m\u@\[\e[1;34m\]\h:\[\e[01;36m\]\w\[\e[01;32m\]\e[0;31m]\[\033[0m\]\$(__git_ps1)\[\e[01;32m\]\$\[\033[0m\] "
        '';
    };

    fish = {
      enable = true;
      vendor ={ 
        completions.enable = true;
        config.enable = true;
      };
#      shellInit = "neofetch";
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
    docker.enable = true;
    libvirtd.enable = true;
#    virtualbox = {
#      host.enable = true;
#      host.enableExtensionPack = true;
#    };
  };


/*
  imports = [
      ./containers/gcpdrgn.nix
      ./containers/gcpsndp.nix
      ./containers/gcpion.nix
      ./containers/awsndp.nix
      ./containers/awsion.nix
  ];

  containers.gcpdrgn.autoStart = false;
  containers.gcpsndp.autoStart = false;
  containers.gcpion.autoStart = true;
  containers.awsndp.autoStart = false;
  containers.awsion.autoStart = true;  
*/

/* example how to use pam
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
#    localtime.enable = true;
    urxvtd.enable = true;
    blueman.enable = true;
    fwupd.enable = true;
    fstrim.enable = true;
    sysstat.enable = true;  
    thinkfan.enable = true;
    gnome3.gnome-keyring.enable = true;
    fail2ban.enable = true;

#  YubiKey support
    pcscd.enable = true;
    udev.packages = [ pkgs.yubikey-personalization ];


/*    
    undervolt = {
      enable = true;
    };
*/

/*  as a root
 acpidump > acpi.out
 acpixtract -a acpi.out
 dptfxtract *.dat 
*/

    # Power button invokes suspend, not shutdown.
    logind = {
      extraConfig = "HandlePowerKey=suspend";
      lidSwitch = "suspend";
    };

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
      servers = [ "0.sg.pool.ntp.org" "1.sg.pool.ntp.org" "2.sg.pool.ntp.org" "3.sg.pool.ntp.org" ];
    };

/*    
    timesyncd = {
      enable = true;
      servers = [ "0.sg.pool.ntp.org" "1.sg.pool.ntp.org" "2.sg.pool.ntp.org" "3.sg.pool.ntp.org" ];
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
        xterm.enable = false;
      };

      displayManager = {
#        setupCommands = ''
#          ${pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource modesetting NVIDIA-0 
#          ${pkgs.xorg.xrandr}/bin/xrandr --auto
#          '';
        defaultSession = "none+i3";

        lightdm = {
          enable = true;
          greeter.enable = false;
          autoLogin.enable = true;
          autoLogin.user = "mudrii";
        };
      };

      windowManager = {
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
          xautolock
          rofi
          numlockx
#          conky
#          rxvt_unicode
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
    #font = "Powerline";
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  fonts = {
    enableFontDir = true;
#    enableCoreFonts = true;
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
      font-awesome_4
#      dejavu_fonts
      google-fonts
      noto-fonts
#      noto-fonts-cjk
      noto-fonts-emoji
#      liberation_ttf
#      fira-code
#      fira-code-symbols
#      mplus-outline-fonts
#      dina-font
#      proggyfonts
#      emojione
      twemoji-color-font
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
#      export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    '';
*/
    variables = {
    # Preferred applications
      EDITOR = "vim";
      BROWSER = "qutebrowser";
    };

    systemPackages = with pkgs; [
      nix-index
      nixpkgs-fmt
      nixpkgs-lint
      nix-prefetch
      nix-du
      graphviz
      (lowPrio nix-prefetch-git)
      nix-prefetch-scripts
      nixFlakes
      unstable.virt-manager
      unstable.virt-viewer
  #    undervolt
      acpica-tools
      patchelf
      binutils
      cryptsetup
      dstat
      gptfdisk
      mc
      nnn
#      vifm
#      lf
      trash-cli
      traceroute
      whois
      which
      nmap
      wget
      neovim
      commonsCompress
      libarchive
      archiver
#      p7zip
      unzip
      unrar
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
  #    tlp
      cpufrequtils
      msr-tools
      nvtop
      sshfs
      vdpauinfo
      dmidecode
      fwupd
      fwupdate
      ncdu
      smartmontools
      pass encfs 
      linuxPackages.perf
      networkmanager
      wirelesstools
  #    blueman
  #    (lowPrio bluez)
  #    bluez-tools
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
      nload
      nvme-cli
      ncurses
    ];

    shellAliases = {
      a="aws";
      ans="ansible";
      ansp="ansible-paybook";
      ansv="ansible-vault";
      ccat="pygmentize -f terminal256 -g -P style=monokai";
      cp="cp -i";
      diff="diff --color=auto";
      dmesg="dmesg --color=always | lless";
      egrep="egrep --color=auto";
      fgrep="fgrep --color=auto";
      g="gcloud";
      grep="grep --color=auto";
      gadcm="git add -A; and git commit";
      gad="git add .";
      gcm="git commit";
      gdf="git diff";
      gl="git log";
      glg="git log --color --graph --pretty --oneline";
      gpl="git pull";
      gps="git push";
      gst="git status";
      k="kubectl";
      kns="kubens";
      ktx="kubectx";
      la="exa -alg --group-directories-first -s=type";
#      la="ls -lha --color=auto --group-directories-first";
      lless="set -gx LESSOPEN '|pygmentize -f terminal256 -g -P style=monokai %s' && set -gx LESS '-R' && less -m -g -i -J -u -Q"; 
#      ll="ls -lah";
#      ls="ls --color=auto";
      ll="exa -la";
      ls="exa";
      mv="mv -i";
      nixcl="sudo nix-store --optimise -v && sudo nix-collect-garbage -d";
      nixup="sudo nix-channel --update && sudo nixos-rebuild switch";
      p="python";
      ping="ping -c3";
      ps="ps -ef";
      rm="rm -i";
      rmf="rm -rf";
      sudo="sudo -i";
      suf="su --shell=/usr/bin/fish";
      t="terraform";
      vdir="vdir --color=auto";
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

#  programs.fish.shellInit = "screenfetch";
#  programs.fish.shellInit = "neofetch";

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
        mupdf
        tmux
        screen
#        keychain
        unstable.minio-client
        unstable.google-cloud-sdk-gce
        unstable.awscli
        unstable.pulumi-bin
        unstable.gitAndTools.gitFull
        unstable.git-lfs
        unstable.terraform
        unstable.terraform-lsp
        unstable.tflint
        unstable.kubernetes
        unstable.kubernetes-helm
        unstable.kind
        unstable.go
        unstable.xmind
        unstable.zoom-us
        unstable.teams
        kubectx
        dep
/*        (unstable.terraform.withPlugins(p: with p; [
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
#        (lowPrio unstable.python38Full)
        python37Full
        (python3.withPackages(ps: with ps; [
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
        ]))
#        python37Packages.pip
#        unstable.python37Packages.virtualenv
#        python37Packages.powerline
#        python37Packages.pygments
#        python37Packages.pycuda
        asciinema
        highlight
        jq
        direnv
        psensor
        firefox
        chromium
        qutebrowser
        unstable.vscode
        unstable.sublime3
        slack
        vlc
        filezilla
        openvpn
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
        paperkey
        gpa
        imagemagick
        spotify
        bookworm
        (unstable.tor-browser-bundle-bin.override {
          mediaSupport = true;
          pulseaudioSupport = true;
        })        
        unstable.keepassxc
        openconnect_openssl
        networkmanager-openconnect
        unstable.riot-desktop
        unstable.ansible
      ];
    };
  };

  nix = {
    useSandbox = true;
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
      #dates = "Mon *-*-* 06:00:00";      
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
    stateVersion = "20.03"; # Did you read the comment?
    autoUpgrade = {
      enable = true;
      dates = "weekly";
      #dates = "Sun *-*-* 04:00:00";
    };
  };

}

