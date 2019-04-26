{ config, pkgs, ... }:
{
  users.users.mudrii = {
    isNormalUser = true;
    home = "/home/mudrii";
    description = "mudrii";
    extraGroups = [ "wheel" "docker" ];
    # mkpasswd -m sha-512 password
    hashedPassword =
"$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCo0hdHZwu+sDGqItYIlgpIQS6/oCbaAMgHHcnrwiHzHhMzVBLGIqcEExkb/PUXgNslfbIaLOVll3no5i0bd/DoP1pfKNfxvGmwntN8WIGLcCE1NlFPDwsCKxRV1TWmpFuwOuA7C75Rm+yGu4no1V+cMEC7rAICQK8bh22JeWISdb+QcTFuZ/RmS5uP4385T9Ps1u16HiwdlFlL9BVxePEEcWOWWlWrX0GoFNQOkLe8GpQmUcuJJtZkEHIcx0JaCnWTX+q5G5V3xv7lvK5vo/pOeHZcWrNaAU5zQ0nYDhxFRRDB+8FABzPYGwrNmVU/ok/ZMAEOpiFwC4tZKbLmwqo3 mudrii@Ions-MacBook-Pro.local" ];
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
#      python37Packages.pygments
      go
      git
      asciinema
      highlight
      jq
      busybox
      ncurses
    ];
  };
}
