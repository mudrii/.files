{ config, pkgs, ... }:

{

  programs = {
    vim.defaultEditor = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };

    bash = {
      enableCompletion = true;
#      shellInit = "neofetch";
      promptInit = ''
          PS1="\n\[\033[1;32m\]\e[0;31m[\[\e]0;\u@\h: \w\a\]\e[01;32m\u@\[\e[1;34m\]\h:\[\e[01;36m\]\w\[\e[01;32m\]\e[0;31m]\[\033[0m\]\$(__git_ps1)\[\e[01;32m\]\$\[\033[0m\] "
        '';
    };

    fish = {
      enable = true;
      vendor ={ 
        completions.enable = true;
        config.enable = true;
      };
#      shellInit = "neofetch";

    };
  
    nano.nanorc = ''
      unset backup
      set nonewlines
      set nowrap
      set tabstospaces
      set tabsize 4
      set constantshow
    '';
  };

}
