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
    openssl
    google-cloud-sdk-gce
    terraform
  ];

  users.mutableUsers = false;

  users.users.gcpdrgn = {
    isNormalUser = true;
    home = "/home/gcpdrgn";
    description = "gcpdrgn account";
    extraGroups = [ "wheel" "docker" ];
    hashedPassword = "$6$bZP4gdOPGzwiHf$eWYm1ANJ23hSQgOMRbE9y2Bw/0q9SEPIvGmViijY6YeTvab8LSH.Kk2/ySqkstFSpVveqs/EL8pHTmWALKuWE.";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBAe1Z000X1/D3rYuwWB7AFeuCkkh4UhyMbKp8mlsY2nWv3XwmzdMQEY6rkg5fNlLb5sL9mpz8oE1XbI9JUgm5aNS9ZPEzC9pTQz3rJwPUSAzsXM6dgSgKgyzXbyCq37l5NiHqaAvxJ+7S0pSzIUvVQiKSH/dh7gv6NNPoJNWYxC/32r+1mowZq/C18PYomoAjXA/Hm7LJZoUTTjKsAB1dpTHK2cLbpxAWEKdip7WmQKqPisbFbv1hBAFymStyWTaeSqpwKKmr3kIMHQwbqNcqMIJ7bE0IczZfYxMpm84w4GBhdfKovzQu+O0a0+nxiSxh3koURV1IWm6QkID0r14h mudrii@nixos" ];
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
