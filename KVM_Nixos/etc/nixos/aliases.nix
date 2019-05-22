{ config, pkgs, ... }:

{
  programs.bash.shellAliases = {
    ccat="pygmentize -f terminal256 -g -P style=monokai";
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
  };
}
