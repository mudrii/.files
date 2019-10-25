{ pkgs, ... }:

{

  imports = [
    .files/.tmux.conf
  ];


  home-manager.users.irutsu = {
    programs = {
      home-manager = {
        enable = true;
        path = [ pkgs.user-environment ];
      };
      vim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [
          vim-airline
          vim-airline-themes
          nerdtree
          ctrlp-vim
          vim-fugitive
        ];
        settings = { ignorecase = true; };
        extraConfig = builtins.readFile .files/.vimrc;
      };
      neovim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [ 
          vim-airline
          vim-airline-themes
          nerdtree
          ctrlp-vim
          vim-fugitive
        ];
        extraConfig = builtins.readFile .files/init.vim;
      };
      git = {
        enable = true;
        userName  = "mudrii";
        userEmail = "mudreac@gmail.com";
      };
      direnv.enable = true;
    };

#    home.sessionVariables.LESS = "-R";

    home.file = {
      ".bashrc".source = .files/.bashrc;
      ".inputrc".source = .files/.inputrc;
      ".dircolors".source = .files/.dircolors;
      ".git-completion.bash".source = .files/.git-completion.bash;
      ".git-prompt.sh".source = .files/.git-prompt.sh;
      ".nanorc".source = .files/.nanorc;
      ".Xresources".source = .files/.Xresources;
      ".config/i3/config".source  = .files/config;
      ".config/i3status-rs/config.toml".source  = .files/config.toml;
      ".config/networkmanager-dmenu/config.ini".source  = .files/config.ini;
      ".config/conky/conky.conf".source  = .files/conky.conf;
      ".config/nixpkgs/config.nix".source  = .files/config.nix;
      ".config/ranger/commands_full.py".source  = .files/ranger/commands_full.py;
      ".config/ranger/commands.py".source  = .files/ranger/commands.py;
      ".config/ranger/rc.conf".source  = .files/ranger/rc.conf;
      ".config/ranger/rifle.conf".source  = .files/ranger/rifle.conf;
      ".config/ranger/scope.sh".source  = .files/ranger/scope.sh;
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
      ".config/fish/functions/gl.fish".source = .files/fish/gl.fish;
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
