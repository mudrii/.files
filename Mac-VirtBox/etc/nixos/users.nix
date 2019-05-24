{ config, pkgs, ... }:

{
  users.users.mudrii = {
    isNormalUser = true;
    home = "/home/mudrii";
    shell = "/run/current-system/sw/bin/fish";
    description = "mudrii";
    extraGroups = [ "wheel" "docker" ];
    # mkpasswd -m sha-512 password
    hashedPassword = "$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDONecfTdWyH2/32IncZfG+UyF1OGkDtnQufwxm/iKMnz53qnou5Tx4A5pWpwXKrbjn7o3TPIvqMYWmNe16vJFU6puQeMdN9K6hXY8R3Bs/7HeghNaga1Lta/caKMgVVhLdJY8nM4LtzTaWWXxEZlzYOVjqWDcGJVtqyXitSRQqw0rSYBnyzNsikBHxH5GuJryD8D5rLquAOpTgOgU0J9GptxrTP2M9RUO+QrQdai5K8iUV1G9m3XCcxvAuwFrvEtefop5KutEhW19sCT1sIWlUTljLWxZ09UDuQVEhWJmYYfN+2MSw1rNYS1Iy2C8tEX6jpxMloEzCa9c/yuxZ2hVHk1jPqb1UP/MaHr86FDhzuei1+66auVS+1O+ONh1sj6rK4wB1KxEnZy/uO33fy5KeSM3oqpy35OUBkkpHgELBf1MeBMazl5VPMhCWsIebRa+tOSuGMlujfjHlJWk6d3Al74Ii/61sEo//UM7be/kUX/+2soa8JseNNZ6UgMJOWimpmjFVBiV4lwBTsM8/Y/lw5iMRvp69vw2fjbmb2QZfBmYDCkA9hp075IvnpBTahenp59F+JpdWiXudcF9A25Jw7kGnCM9cwoe8/AB33aEno1u+9t9Yix4CMso6Dzm50J/7iZRV0ApbeheS63oHL/wCCEAkIWC0d55dloWLRMR8cw== mudrii@Ions-MacBook-Pro.local" ];
    packages = with pkgs; [
      screenfetch
      ranger
      elinks
      mediainfo
      w3m
      ffmpegthumbnailer
      mupdf
      poppler_utils
      tmux
      keychain
      google-cloud-sdk-gce
      awscli
      aws-iam-authenticator
      terraform
      kubernetes
      kubectx
      gnumake
      dep
      python37Full
      python37Packages.pip
      python37Packages.virtualenv
      python37Packages.powerline
#      python37Packages.pygments
      go
      git
      asciinema
      highlight
      jq
      direnv
      busybox
      ncurses
      vimPlugins.vim-airline
      vimPlugins.vim-airline-themes
    ];
  };
    nixpkgs.config.allowBroken = true;
}