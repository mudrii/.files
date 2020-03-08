{ config, pkgs, ... }:

{

  programs.bash.shellAliases = {
    la="ls -lha --color=auto --group-directories-first";
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
    k="kubectl";
    ktx="kubectx";
    kns="kubens";
    t="terraform";
    g="gcloud";
    a="aws";
    p="python";
    gad="git add .";
    gcm="git commit -a";
    gdf="git diff";
    glg="git log --color --graph --pretty --oneline";
    gl="git log";
    gpl="git pull";
    gps="git push";
    gst="git status";
  };

  programs.fish.shellAliases = {
    a="aws";
    ans="ansible";
    ansp="ansible-paybook";
    ansv="ansible-vault";
    ccat="pygmentize -f terminal256 -g -P style=monokai";
    cp="cp -i";
    diff="diff --color=auto";
    dmesg="dmesg --color=always | lless";
    egrep="egrep --color=auto";
    fgrep="fgrep --color=auto";
    grep="grep --color=auto";
    gadcm="git add -A; and git commit";
    gad="git add .";
    gcm="git commit";
    gdf="git diff";
    gl="git log";
    glg="git log --color --graph --pretty --oneline";
    gpl="git pull";
    gps="git push";
    gst="git status";
    k="kubectl";
    la="ls -lha --color=auto --group-directories-first";
    lless="set -gx LESSOPEN '|pygmentize -f terminal256 -g -P style=monokai %s' && set -gx LESS '-R' && less -m -g -i -J -u -Q"; 
    ll="ls -lah";
    ls="ls --color=auto";
#    man="set -gx LESS_TERMCAP_md \e'[01;31m' && set -gx LESS_TERMCAP_me \e'[0m' && set -gx LESS_TERMCAP_se \e'[0m' && set -gx LESS_TERMCAP_so \e'[01;44;33m' && set -gx LESS_TERMCAP_ue \e'[0m' && set -gx LESS_TERMCAP_us \e'[01;32m' && man";
    mv="mv -i";
    nixcl="sudo nix-store --optimise -v && sudo nix-collect-garbage -d";
    nixup="sudo nix-channel --update && sudo nixos-rebuild switch";
    p="python";
    ps="ps -ef";
    rm="rm -i";
    rmf="rm -rf";
    sudo="sudo -i";
    suf="su --shell=/usr/bin/fish";
    t="terraform";
    vdir="vdir --color=auto";
  }; 

}
