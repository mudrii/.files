{ config, pkgs, ... }:

{
  programs = {
    vim.defaultEditor = true;
    bash.enableCompletion = true;
    mtr.enable = true;
    gnupg.agent = { enable = true; enableSSHSupport = true; };

    fish = {
      enable = true;
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

#  programs.bash.shellInit = "neofetch";
}
