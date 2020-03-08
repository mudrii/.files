{ config, pkgs, ... }:

{

  programs = {
    vim.defaultEditor = true;
    bash.enableCompletion = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };
#    bash.shellInit = "neofetch";

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
