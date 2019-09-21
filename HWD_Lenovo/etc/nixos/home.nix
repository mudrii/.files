{ config, pkgs, ... }:

{
  home-manager.users.mudrii = {
    programs.vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ vim-airline vim-airline-themes nerdtree ctrlp-vim vim-fugitive ];
      settings = { ignorecase = true; };
      extraConfig = builtins.readFile .files/.vimrc;
    };

    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ vim-airline vim-airline-themes nerdtree ctrlp-vim vim-fugitive ];
      extraConfig = builtins.readFile .files/init.vim;
    };

    programs.git = {
      enable = true;
      userName  = "mudrii";
      userEmail = "mudreac@gmail.com";
      };

    home.file = {

      ".tmux.conf".source = .files/.tmux.conf;

      ".nanorc".source = .files/.nanorc;

      ".config/fish/config.fish".source  = .files/fish/config.fish;
      
      ".config/fish/functions/a.fish".source  = .files/fish/a.fish;
     
      ".config/fish/functions/ccat.fish".source  = .files/fish/ccat.fish;

      ".config/fish/functions/ccd.fish".source  = .files/fish/ccd.fish;

      ".config/fish/functions/cp.fish".source  = .files/fish/cp.fish;

      ".config/fish/functions/diff.fish".source = .files/fish/diff.fish;

      ".config/fish/functions/dmesg.fish".source = .files/fish/dmesg.fish;

      ".config/fish/functions/egrep.fish".source = .files/fish/egrep.fish;

      ".config/fish/functions/fgrep.fish".source = .files/fish/fgrep.fish;

      ".config/fish/functions/fish_user_key_bindings.fish".source = .files/fish/fish_user_key_bindings.fish;

      ".config/fish/functions/gad.fish".source = .files/fish/gad.fish;

      ".config/fish/functions/gadcm.fish".source = .files/fish/gadcm.fish;

      ".config/fish/functions/gcm.fish".source = .files/fish/gcm.fish;

      ".config/fish/functions/gdf.fish".source = .files/fish/gdf.fish;

      ".config/fish/functions/glg.fish".source = .files/fish/glg.fish;

      ".config/fish/functions/gpl.fish".source = .files/fish/gpl.fish;

      ".config/fish/functions/gps.fish".source = .files/fish/gps.fish;

      ".config/fish/functions/grep.fish".source = .files/fish/grep.fish;

      ".config/fish/functions/gst.fish".source = .files/fish/gst.fish;

      ".config/fish/functions/k.fish".source = .files/fish/k.fish;

      ".config/fish/functions/la.fish".source = .files/fish/la.fish;

      ".config/fish/functions/lless.fish".source = .files/fish/lless.fish;

      ".config/fish/functions/ll.fish".source = .files/fish/ll.fish;

      ".config/fish/functions/ls.fish".source = .files/fish/ls.fish;

      ".config/fish/functions/man.fish".source = .files/fish/man.fish;

      ".config/fish/functions/mv.fish".source = .files/fish/mv.fish;

      ".config/fish/functions/rm.fish".source = .files/fish/rm.fish;

      ".config/fish/functions/p.fish".source = .files/fish/p.fish;

      ".config/fish/functions/ps.fish".source = .files/fish/ps.fish;

      ".config/fish/functions/su.fish".source = .files/fish/su.fish;

      ".config/fish/functions/sudo.fish".source = .files/fish/sudo.fish;

      ".config/fish/functions/t.fish".source = .files/fish/t.fish;

      ".config/fish/functions/vdir.fish".source = .files/fish/vdir.fish;
      
      ".config/fish/functions/fish_greeting.fish".source = .files/fish/fish_greeting.fish;

    };

  };
}
