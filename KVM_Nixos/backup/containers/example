{ config, lib, pkgs, ... }:

with lib;

{ 
  boot.isContainer = true;
  networking.hostName = mkDefault "test";
  networking.useDHCP = false;
  
  virtualisation.docker.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wget
    vim
    tmux
    keychain
    commonsCompress
    p7zip
    unzip
    jq
    lsof
    python37Packages.pygments
  ];

  users.users.test = {
    isNormalUser = true;
    home = "/home/test";
    description = "test";
    extraGroups = [ "wheel" "docker" ];
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
}
