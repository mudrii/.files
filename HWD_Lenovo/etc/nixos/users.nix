{ config, pkgs, ... }:

#let
#  unstableTarball =
#    fetchTarball
#      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
#in

{

#  nixpkgs.config = {
#    packageOverrides = pkgs: {
#      unstable = import unstableTarball {
#        config = config.nixpkgs.config;
#      };
#    };
#  };

  users.users.mudrii = {
    isNormalUser = true;
    home = "/home/mudrii";
    shell = "/run/current-system/sw/bin/fish";
    description = "mudrii";
    extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ];
    # mkpasswd -m sha-512 password
    hashedPassword = "$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzc7Xx3FVqz2cV1qzkPFV9DmfXCvS98HWs6nzcZ+1zMQDpZUuSGY2hV8UyXgiitogLl3BTaKztvBmrzh3FeeRHYDX39eR+tvcL7mY+qIqUwyCrDcrXC+KHuMVcYWJPJBx+enlId/ZbBgzz4SpBTOVANGDv1AhkNhl1CDfSrIOSdoRdhQpcYqtjwmiy/giGhfwNwtTGFVJNXG5CZEtyKRyjN43dX12/g6eEThLpjAS7QxF8pCzLh754rjD4V4Qmg/t+BawOglSyNaqEBtdyd0xiI353hzdNG4U+6V3yPYKSdkZzHaGACwCNMKSfrF7IrIQtUc5d9b0H+XEjpKzPWaZWXg9Io/vKhSTK4brXeAnsck4kbWYj1RiU6noAZNZRleM8fMO6UdwzLZzrxGMOBFSSZHHUlgLEjadkc2kmGwvXx5bmEUXMCAb7jUIzv+TEoOcJfCj8xUGxCQtlk9kIguV0l8BWY0B6iwyNn8XM7taLdfIEMACkuD9v0y7SCBWRm6DL3PoVijnGX+g3ox1bGvx/9+4h1HbPH3POj5/C2Vh6kWtXFKTVHSrU4m8HsV94slD4ILTyfJxGWgL2TzjSJz3eKUlVNe9r1Pv14CDb2XaN4lGGxWV2aYDYwCwNaZyJTOXi/9tiflfmcHIiYRoABrss6nssfL2f6fNa0hm0ZAUClw== mudrii@arch" ];
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
#      unstable.google-cloud-sdk-gce
#      unstable.awscli
#      unstable.terraform_0_12
#      unstable.kubernetes
#      unstable.go
      google-cloud-sdk-gce
      awscli
      terraform_0_12
      kubernetes
      kubectx
      go
      gnumake
      dep
      python37Full
      python37Packages.pip
      python37Packages.virtualenv
      python37Packages.powerline
      python37Packages.pygments
      python37Packages.pygments-markdown-lexer
      python37Packages.xstatic-pygments
      git
      neovim
      asciinema
      highlight
      jq
      direnv
#      busybox
      ncurses
      bat
      fd
      sshfs
      psensor
      firefox
      chromium
      vscode
      sublime
      slack
      zoom-us
      xmind
      vlc
    ];
  };

  nixpkgs.config.allowBroken = true;

}
