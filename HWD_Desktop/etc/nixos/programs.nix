{ config, pkgs, ... }:

{
  programs = {
#    bash.shellInit = "neofetch";
    bash.enableCompletion = true;
    vim.defaultEditor = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };

    fish = {
      enable = true;
#      shellInit = "neofetch";
      vendor ={ 
        completions.enable = true;
        config.enable = true;
      };
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
