{ config, pkgs, ... }:

{

  containers.awsion =

  {

    privateNetwork = true;
    hostAddress = "192.168.0.1";
    localAddress = "192.168.0.2";

    config =

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
        python37Full
        python37Packages.pygments
        atool
        rsync
        gnutls
        bind
        file
        openssl
        awscli
        aws-iam-authenticator
        terraform
        kubernetes
        screenfetch
      ];

      users.mutableUsers = false;

      users.users.awsion = {
        isNormalUser = true;
        home = "/home/awsion";
        description = "aws ion account";
        extraGroups = [ "wheel" "docker" ];
        hashedPassword = "$6$q4aqKJOqN$vmFUftngQJBEE3pkCOfXNERErt7cstUHOHxV01AZBcWjXOESLT57JgtuNzgDPkcR8uLttOokxhgybUZuaE5gQ1";
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
        ping="ping -c3";
      };

      programs.bash.enableCompletion = true;
      security.sudo.wheelNeedsPassword = false;
      nixpkgs.config.allowUnfree = true;
      system.autoUpgrade.enable = true;

    };
  };
}
