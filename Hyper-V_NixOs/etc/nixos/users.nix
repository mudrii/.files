{ config, pkgs, ... }:
{
  users.users.mudrii = {
    isNormalUser = true;
    home = "/home/mudrii";
    description = "mudrii";
    shell = "/run/current-system/sw/bin/fish";
    extraGroups = [ "wheel" "docker" ];
    # mkpasswd -m sha-512 password
    hashedPassword = "$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfaFqvY4lhx4KGvd2WEnd6m7zoDNvLRVYSBXEUWTjiGZ8DddD+tDC4I8MvPsEHUw3pYjBicOPsVK356dviu6JpEuhzxzW2/6YJvFN8EqPZIFcX9rNz3YNEkEam+SEWjwtjMe+hpB6FNwofZKvlqS73y3DYERpobYax548nOxGseCPBuXRlB7nmABe1wKs/YWVg4GbM+HYofgYWFkqYEgVM6HG4P7/kcywmaDqYoaO32fGtEm9VIBAmlDU35eA+U/E4kaxOWr2HmjOL2tMbhxYoMNuRFAvOHnWveSOA/MlQorcI5a8BLK5oZFP2BgtG1vuNPueb2c2UxGe+y6KT3Biz mudre@Nelu" ];
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
      busybox
      vimPlugins.vim-airline 
    ];
  };
}
