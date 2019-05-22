{ config, lib, pkgs, ... }:

with lib;

{ 
  boot.isContainer = true;
  
  virtualisation.docker.enable = true;

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "yes";

  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    commonsCompress
    p7zip
    unzip
    jq
    tree
    ag
    htop
    python37Packages.pygments
    atool
    rsync
    gnutls
    bind
    file
    google-cloud-sdk-gce
  ];

  users.mutableUsers = false;

  users.users.gcpdrgn = {
    isNormalUser = true;
    home = "/home/gcpdrgn";
    description = "gcpdrgn account";
    extraGroups = [ "wheel" "docker" ];
    hashedPassword = "$6$bZP4gdOPGzwiHf$eWYm1ANJ23hSQgOMRbE9y2Bw/0q9SEPIvGmViijY6YeTvab8LSH.Kk2/ySqkstFSpVveqs/EL8pHTmWALKuWE.";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBlKRPfcPco8PPXdC+sOcYmbH16bVG2+0YqAjpndYGB6p0ap3UEEK96gUlT8VnCTnWXlQEGS6w+vyeJCBCpIQIl8pnYjK9TOF7MHXfnHIsAtw2nWvf0UafKJlSRlerl9IC2svLyyikwlDY14/9EcdbxBGABWUpFZUfyrjOFsIe+shziylR0ftUgFWQ2YxuL6vXvKwbUfeNrl5tc7shCELpLOdj3XhAoKOMh6jDT30W+8c7vD2qZWi8WNLRNMeqMwvot07lv8F3V7hlYEo9dZ0147Gqba3Uw03Dhoevcx2zjQXTmEn/1WMjlSaf8ZZDRWj499qXFpR26xqafyCc6/d3 mudrii@nixos" ];
  };
  programs.bash.shellAliases = {
    cat="pygmentize -f terminal256 -g -P style=monokai";
    lo="ls -lha --color=auto --group-directories-first";
    dmesg="dmesg --color=always | less";
    sudo="sudo -i";
    ls="ls --color=auto";
    diff="diff --color=auto";
    vdir="vdir --color=auto";
    grep="grep --color=auto";
    fgrep="fgrep --color=auto";
    egrep="egrep --color=auto";
    mv="mv -i";
    rm="rm -i";
    cp="cp -i";
    exit="clear ; exit";
  };

  programs.bash.enableCompletion = true;
  security.sudo.wheelNeedsPassword = false;
  nixpkgs.config.allowUnfree = true;
  system.autoUpgrade.enable = true;
}
