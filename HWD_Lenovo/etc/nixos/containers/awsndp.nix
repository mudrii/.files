{ config, pkgs, ... }:
{
  containers.awsndp =
  {
    privateNetwork = true;
    hostAddress = "192.168.1.1";
    localAddress = "192.168.1.2";
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
        python37Packages.pygments
        atool
        rsync
        gnutls
        bind
        file
        openssl
        aws
        terraform
        kubernetes
				screenfetch
      ];

      users.mutableUsers = false;

      users.users.awsndp = {
        isNormalUser = true;
        home = "/home/awsndp";
        description = "aws sandeep account";
        extraGroups = [ "wheel" "docker" ];
        hashedPassword = "$6$q4aqKJOqN$vmFUftngQJBEE3pkCOfXNERErt7cstUHOHxV01AZBcWjXOESLT57JgtuNzgDPkcR8uLttOokxhgybUZuaE5gQ1";
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrO4j54rPofbXzSIJyXeBzDIrUqM7OulBd5+r7RWbKdjq8GanLa/8h83QhgtSOj8mG6p3YBlVJRPJiAU9N0RywARZPbb+yp/r4ey1HxcjXTNsXHEcRqdykRsAYKRkEyvbvfllX0eYLpIMoRVM278Y7XFS186TtwSHyfi5w3Q/HU/WPEkn1+mDQnjzSmlumXFOkMcayaXUUQtHTiskQyXYKrCehLEQX1T4zuPUQdHpJv2W6yIb0UjZJ4fjP0hUGbcHjmNItcL5vbTZKN8QRegFOEPafLWgltL6/mgUlRLy3zB34A4BJGSvs7CVJC8wdBxy1RnmZx+yNfe8fqAODA3gp9owd6I8vZEJpvTJjjYCh/OX6uzhGsmZNC45UDFBryGuKw0TrWI6uQfYF3NkxtFuzK+xlK5ha1zEoPKBrkkwC8xWovNcvYuoSCsiVWv6Ej3rJ5hdONVLOmsPIltDJas+cZktjH7ep2z8+kmMh6SxhNOt12J+PaRNYmcWpm5stuNRs3rGgtrxbLyt/yvphzCVyJFcFGUbnLgpsIqOkUl5TPM9ks/gGHKEwTzy3E3mgiOicr2w0K31HGQnoR8I6azgbKdV3M+FsCETEIg0FMh5yncMFI6ZsdLa5kGWqwRsUE76GFIpey+AFV2GtQPz6N6OXRtivwPLgq9gC64ASqJPDYw== mudrii@nixos" ];
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
      programs.bash.shellInit = "screenfetch";
      programs.bash.enableCompletion = true;
      security.sudo.wheelNeedsPassword = false;
      nixpkgs.config.allowUnfree = true;
      system.autoUpgrade.enable = true;
    };
  };
}
