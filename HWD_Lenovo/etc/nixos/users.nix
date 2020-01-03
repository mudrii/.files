{ config, pkgs, ... }:

#let
#  unstableTarball =
#    fetchTarball
#      https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz;
#in

# Install with unstable repo
# sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable
# sudo nix-channel --update unstable
# sudo nix-channel --update nixos
# sudo nix-channel --list
let
  unstable = import <unstable> { 
    config.allowUnfree = true; 
  };
in

{

#  nixpkgs.config = {
#    packageOverrides = pkgs: {
#      unstable = import unstableTarball {
#        config = config.nixpkgs.config;
#      };
#    };
#  };

#  programs.fish.shellInit = "screenfetch";
  security.sudo.wheelNeedsPassword = false;

  users = {
    mutableUsers = false;
    users.mudrii = {
      isNormalUser = true;
      home = "/home/mudrii";
      shell = "/run/current-system/sw/bin/fish";
      description = "mudrii";
      extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ];
    # mkpasswd -m sha-512 password
      hashedPassword = "$6$ewXNcoQRNG$czTic9vE8CGH.eo4mabZsHVRdmTjtJF4SdDnIK0O/4STgzB5T2nD3Co.dRpVS3/uDD24YUxWrTDy2KRv7m/3N1";
      openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzc7Xx3FVqz2cV1qzkPFV9DmfXCvS98HWs6nzcZ+1zMQDpZUuSGY2hV8UyXgiitogLl3BTaKztvBmrzh3FeeRHYDX39eR+tvcL7mY+qIqUwyCrDcrXC+KHuMVcYWJPJBx+enlId/ZbBgzz4SpBTOVANGDv1AhkNhl1CDfSrIOSdoRdhQpcYqtjwmiy/giGhfwNwtTGFVJNXG5CZEtyKRyjN43dX12/g6eEThLpjAS7QxF8pCzLh754rjD4V4Qmg/t+BawOglSyNaqEBtdyd0xiI353hzdNG4U+6V3yPYKSdkZzHaGACwCNMKSfrF7IrIQtUc5d9b0H+XEjpKzPWaZWXg9Io/vKhSTK4brXeAnsck4kbWYj1RiU6noAZNZRleM8fMO6UdwzLZzrxGMOBFSSZHHUlgLEjadkc2kmGwvXx5bmEUXMCAb7jUIzv+TEoOcJfCj8xUGxCQtlk9kIguV0l8BWY0B6iwyNn8XM7taLdfIEMACkuD9v0y7SCBWRm6DL3PoVijnGX+g3ox1bGvx/9+4h1HbPH3POj5/C2Vh6kWtXFKTVHSrU4m8HsV94slD4ILTyfJxGWgL2TzjSJz3eKUlVNe9r1Pv14CDb2XaN4lGGxWV2aYDYwCwNaZyJTOXi/9tiflfmcHIiYRoABrss6nssfL2f6fNa0hm0ZAUClw== mudrii@arch" ];
      packages = with pkgs; [
        fish
        neofetch
        ranger
        poppler_utils
        elinks
        mediainfo
        w3m
        ffmpeg-full
        mupdf
        tmux
        keychain
        unstable.minio-client
        unstable.google-cloud-sdk-gce
        unstable.awscli
        unstable.pulumi-bin
        unstable.terraform
        unstable.terraform-lsp
        unstable.tflint
        unstable.kubernetes
        unstable.go
        unstable.xmind
        unstable.zoom-us
#        (unstable [ zoom-us ])
        kubectx
        dep
#        (unstable.terraform.withPlugins(p: with p; [
#          archive
#          aws
#          external
#          google
#          helm
#          kubernetes
#          local
#          null
#          random
#          template
#        ]))
        python37Full
        (unstable.python3.withPackages(ps: with ps; [
          pip
          virtualenv
          powerline
          pygments
          pygments-markdown-lexer
          xstatic-pygments
          pylint
          pandas
          numpy
          jupyter
          xonsh
          virtualenvwrapper
        ]))
#        python37Packages.pip
#        python37Packages.virtualenv
#        python37Packages.powerline
#        python37Packages.pygments
        git
        git-lfs
        neovim
        asciinema
        highlight
        jq
        direnv
        ncurses
        psensor
        firefox
        chromium
        unstable.vscode
        unstable.sublime3
        slack
        vlc
        filezilla
        openvpn
        gpicview
        home-manager
        fzf
        bat
        fd
        skypeforlinux
        zathura
        mpv
        feh
        weechat
        gcc gnumake
        gnupg
        spotify
        bookworm
        (unstable.tor-browser-bundle-bin.override {
          mediaSupport = true;
          pulseaudioSupport = true;
        })        
        keepassxc
        openconnect_openssl
        networkmanager-openconnect
        unstable.riot-desktop
      ];
    };
  };

}
