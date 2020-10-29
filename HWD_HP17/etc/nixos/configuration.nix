# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  unstable = import <unstable> {
    config.allowUnfree = true;
  };
in

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
      ./fonts.nix
      ./aliases.nix
      ./xserver.nix
      ./users.nix
      <home-manager/nixos>
#      "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"
      ./home.nix
    ];

  hardware = {
    cpu.intel.updateMicrocode = true;
    enableRedistributableFirmware = true;
#    enableAllFirmware = true;
    bluetooth.enable = true;
    pulseaudio = {
      enable = true;
      support32Bit = true;
      package = pkgs.pulseaudioFull;
    };
  };

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

#  powerManagement = {
#    enable = true;
##   powertop.enable = true;
##    cpuFreqGovernor =  "ondemand"; # "powersave", "performance" 
#  };

  networking = {
    hostName = "hp-nixos";
    networkmanager.enable = true;
    nameservers = [ "8.8.8.8" "8.8.4.4" ];
    enableIPv6 = false;
    useDHCP = false;
    interfaces.eno1.useDHCP = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [ 22 80 443 ];
      allowedUDPPorts = [ 53 ];
      allowPing = true;
#      trustedInterfaces = [ "docker0" ];
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


  # Set your time zone.
  time.timeZone = "Asia/Singapore";

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:
#  virtualisation = {
#    docker.enable = true;
#    virtualbox.host.enable = true;
#    virtualbox.host.enableExtensionPack = true;
#  };

  programs = {
    fish.enable = true;
    vim.defaultEditor = true;
    bash.enableCompletion = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };
  };

  nixpkgs.config = {
    pulseaudio = true;
    allowBroken = true;
    allowUnfree = true; 
  };

  # Enable the OpenSSH daemon.
  services = {
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
      #extraConfig = ''
      settings = {
# Detailked info can be found https://linrunner.de/tlp/settings/index.html

# Disables builtin radio devices on boot:
#    bluetooth
#    wifi – Wireless LAN (Wi-Fi)
#    wwan – Wireless Wide Area Network (3G/UMTS, 4G/LTE, 5G)
         
#       DEVICES_TO_DISABLE_ON_STARTUP="bluetooth wifi"

# Set battery charge thresholds for main battery (BAT0) and auxiliary/Ultrabay battery (BAT1). Values are given as a percentage of the full capacity. A value of 0 is translated to the hardware defaults 96/100%.        

        START_CHARGE_THRESH_BAT0=60;
        STOP_CHARGE_THRESH_BAT0=80;


# Control battery feature drivers:
      
        NATACPI_ENABLE=1;
        TPACPI_ENABLE=1;
        TPSMAPI_ENABLE=1;

# Defines the disk devices the following parameters are effective for. Multiple devices are separated with blanks.

        DISK_DEVICES="nvme0n1";

# Set the “Advanced Power Management Level”. Possible values range between 1 and 255.
#    1 – max power saving / minimum performance – Important: this setting may lead to increased disk drive wear and tear because of excessive read-write head unloading (recognizable from the clicking noises)
#    128 – compromise between power saving and wear (TLP standard setting on battery)
#    192 – prevents excessive head unloading of some HDDs
#    254 – minimum power saving / max performance (TLP standard setting on AC)
#    255 – disable APM (not supported by some disk models)
#    keep – special value to skip this setting for the particular disk (synonym: _)

        DISK_APM_LEVEL_ON_AC="254 254";
        DISK_APM_LEVEL_ON_BAT="128 128";

# Set the min/max/turbo frequency for the Intel GPU. Possible values depend on your hardware. See the output of tlp-stat -g for available frequencies.

        INTEL_GPU_MIN_FREQ_ON_AC=200;
        INTEL_GPU_MIN_FREQ_ON_BAT=200;
        INTEL_GPU_MAX_FREQ_ON_AC=1200;
        INTEL_GPU_MAX_FREQ_ON_BAT=800;
        INTEL_GPU_BOOST_FREQ_ON_AC=1200;
        INTEL_GPU_BOOST_FREQ_ON_BAT=1000;

# Selects the CPU scaling governor for automatic frequency scaling.
# For Intel Core i 2nd gen. (“Sandy Bridge”) or newer Intel CPUs. Supported governors are:
#    powersave – recommended (kernel default)
#    performance

        #CPU_SCALING_GOVERNOR_ON_AC=powersave;
        #CPU_SCALING_GOVERNOR_ON_BAT=powersave;

# Set Intel CPU energy/performance policies HWP.EPP and EPB (in order of increasing power saving):
#    performance
#    balance_performance
#    default
#    balance_power
#    power
# Default when unconfigured: balance_performance (AC), balance_power (BAT)
# Hints:
#    Requires Intel Core i CPU and the intel_pstate scaling driver
#    HWP.EPP requires kernel 4.10 and Intel Core i Gen. 5 (Skylake) or newer CPU
#    EPB requires kernel 5.2 or module msr and x86_energy_perf_policy from linux-tools
#    When HWP.EPP is available, EPB is not set

        #CPU_ENERGY_PERF_POLICY_ON_AC=balance_power;
        #CPU_ENERGY_PERF_POLICY_ON_BAT=power;

# Intel CPU energy/performance policy HWP.EPP. Possible values are
#    performance
#    balance_performance
#    default
#    balance_power
#    power
# Version 1.2.2 and lower For version 1.3 and higher this parameter is replaced by CPU_ENERGY_PERF_POLICY_ON_AC/BAT

        #CPU_HWP_ON_AC=balance_performance;
        #CPU_HWP_ON_BAT=power;

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
#    performance
#    balance-performance
#    default (deprecated: normal)
#    balance-power
#    power (deprecated: powersave)
# Version 1.2.2 and lower For version 1.3 and higher this parameter is replaced by CPU_ENERGY_PERF_POLICY_ON_AC/BAT

        #ENERGY_PERF_POLICY_ON_AC=balance-performance;
        #ENERGY_PERF_POLICY_ON_BAT=power;

# Timeout (in seconds) for the audio power saving mode (supports Intel HDA, AC97). A value of 0 disables power save.

        SOUND_POWER_SAVE_ON_AC=0;
        SOUND_POWER_SAVE_ON_BAT=1;

# Controls runtime power management for PCIe devices.

        #RUNTIME_PM_ON_AC=on;
        #RUNTIME_PM_ON_BAT=auto;

# Sets PCIe ASPM power saving mode. Possible values:
#    default – recommended
#    performance
#    powersave
#    powersupersave

        #PCIE_ASPM_ON_AC=default;
        #PCIE_ASPM_ON_BAT=default;
     # '';
      };
    };
    blueman.enable = true;
    fwupd.enable = true;
    dbus.packages = [ pkgs.fwupd ];
  };

  # Enable CUPS to print documents.
#  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  
#  programs.bash.shellInit = "screenfetch";

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "20.09"; # Did you read the comment?

  system.autoUpgrade = {
    enable = true;
    dates = "weekly";
  };

   nix = {
     gc = {
       automatic = true;
       dates = "weekly";
       options = "--delete-older-than 10d";
     };
     autoOptimiseStore = true;
     optimise = {
       automatic = true;
       dates = [ "weekly" ];
     };
   };

}
