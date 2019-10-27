{ config, pkgs, ... }:

let
  unstable = import <unstable> { 
    config.allowUnfree = true; 
  };
in

{

#  programs.fish.shellInit = "neofetch";
  security.sudo.wheelNeedsPassword = false;

  users = {
    mutableUsers = false;
    users.andre = {
      isNormalUser = true;
      home = "/home/andre";
      shell = "/run/current-system/sw/bin/fish";
      description = "Andre account";
      extraGroups = [ "wheel" "docker" "audio" "video" "networkmanager" ];
    # mkpasswd -m sha-512 password
    hashedPassword = "$6$bbInDjWAf$gEdZB1H9Tkedai90JXMmyi6UR1bACgP6N1iNJJC4KLbx6Zg2kyqAYEFQhZN96ykB6headHYcSMALpiqQkHnoA0";
      packages = with pkgs; [
        fish
        neofetch
        ranger
        poppler_utils        
        elinks
        mediainfo
        w3m
        ffmpeg-full        
#        ffmpegthumbnailer
        mupdf
        tmux
        keychain
        unstable.google-cloud-sdk-gce
        unstable.awscli
        unstable.terraform
        unstable.terraform-lsp
        unstable.tflint
        unstable.kubernetes
        unstable.go
        unstable.xmind
        unstable.zoom-us
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
          xonsh
          virtualenvwrapper
        ]))
        git
        neovim
        asciinema
        highlight
        jq
        direnv
        ncurses
        psensor
        firefox
        chromium
        vscode
        sublime
        slack
        vlc
        filezilla
        openvpn
        gpicview
        home-manager
        fzf
        fd
        bat
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

      ];
    };
  };

}
