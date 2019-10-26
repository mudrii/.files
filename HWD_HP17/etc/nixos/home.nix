{ config, pkgs, ... }:

{

  imports = [
    dotfiles/.tmux.conf
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
          fzf-vim
        ];
        settings = { ignorecase = true; };
        extraConfig = builtins.readFile dotfiles/.vimrc;
      };
      neovim = {
        enable = true;
        plugins = with pkgs.vimPlugins; [ 
          vim-airline
          vim-airline-themes
          nerdtree
          ctrlp-vim
          vim-fugitive
          fzf-vim
        ];
        extraConfig = builtins.readFile dotfiles/.vimrc;
      };
      git = {
        enable = true;
        userName  = "mudrii";
        userEmail = "mudreac@gmail.com";
        aliases = {
          unstage = "reset HEAD --";
          pr = "pull --rebase";
          addp = "add --patch";
          comp = "commit --patch";
          co = "checkout";
          ci = "commit";
          c = "commit";
          b = "branch";
          p = "push";
          d = "diff";
          a = "add";
          s = "status";
          f = "fetch";
          br = "branch";
          pa = "add --patch";
          pc = "commit --patch";
          rf = "reflog";
          l = "log --graph --pretty='%Cred%h%Creset - %C(bold blue)<%an>%Creset %s%C(yellow)%d%Creset %Cgreen(%cr)' --abbrev-commit --date=relative";
          pp = "!git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)";
          recent-branches = "branch --sort=-committerdate"; 
        };
        extraConfig = {
          merge.conflictstyle = "diff3";
        };
      };
      direnv.enable = true;
    };

#    home.sessionVariables.LESS = "-R";

    home.file = {
      ".bashrc".source = dotfiles/.bashrc;
      ".inputrc".source = dotfiles/.inputrc;
      ".dircolors".source = dotfiles/.dircolors;
      ".git-completion.bash".source = dotfiles/.git-completion.bash;
      ".git-prompt.sh".source = dotfiles/.git-prompt.sh;
      ".nanorc".source = dotfiles/.nanorc;
      ".Xresources".source = dotfiles/.Xresources;
      ".config/neofetch/config.conf".source = dotfiles/config.conf;
      ".config/i3/config".source = dotfiles/config;
      ".config/i3status-rs/config.toml".source  = dotfiles/config.toml;
      ".config/networkmanager-dmenu/config.ini".source  = dotfiles/config.ini;
      ".config/conky/conky.conf".source = dotfiles/conky.conf;
      ".config/nixpkgs/config.nix".source = dotfiles/config.nix;
      ".config/ranger/commands_full.py".source = dotfiles/ranger/commands_full.py;
      ".config/ranger/commands.py".source = dotfiles/ranger/commands.py;
      ".config/ranger/rc.conf".source = dotfiles/ranger/rc.conf;
      ".config/ranger/rifle.conf".source = dotfiles/ranger/rifle.conf;
      ".config/ranger/scope.sh".source = dotfiles/ranger/scope.sh;
      ".config/fish/config.fish".source = dotfiles/fish/config.fish;
      ".config/fish/functions/a.fish".source = dotfiles/fish/a.fish;
      ".config/fish/functions/ccat.fish".source = dotfiles/fish/ccat.fish;
      ".config/fish/functions/ccd.fish".source = dotfiles/fish/ccd.fish;
      ".config/fish/functions/cp.fish".source = dotfiles/fish/cp.fish;
      ".config/fish/functions/diff.fish".source = dotfiles/fish/diff.fish;
      ".config/fish/functions/dmesg.fish".source = dotfiles/fish/dmesg.fish;
      ".config/fish/functions/egrep.fish".source = dotfiles/fish/egrep.fish;
      ".config/fish/functions/fgrep.fish".source = dotfiles/fish/fgrep.fish;
      ".config/fish/functions/fish_user_key_bindings.fish".source = dotfiles/fish/fish_user_key_bindings.fish;
      ".config/fish/functions/gad.fish".source = dotfiles/fish/gad.fish;
      ".config/fish/functions/gadcm.fish".source = dotfiles/fish/gadcm.fish;
      ".config/fish/functions/gcm.fish".source = dotfiles/fish/gcm.fish;
      ".config/fish/functions/gdf.fish".source = dotfiles/fish/gdf.fish;
      ".config/fish/functions/gl.fish".source = dotfiles/fish/gl.fish;
      ".config/fish/functions/glg.fish".source = dotfiles/fish/glg.fish;
      ".config/fish/functions/gpl.fish".source = dotfiles/fish/gpl.fish;
      ".config/fish/functions/gps.fish".source = dotfiles/fish/gps.fish;
      ".config/fish/functions/grep.fish".source = dotfiles/fish/grep.fish;
      ".config/fish/functions/gst.fish".source = dotfiles/fish/gst.fish;
      ".config/fish/functions/k.fish".source = dotfiles/fish/k.fish;
      ".config/fish/functions/la.fish".source = dotfiles/fish/la.fish;
      ".config/fish/functions/lless.fish".source = dotfiles/fish/lless.fish;
      ".config/fish/functions/ll.fish".source = dotfiles/fish/ll.fish;
      ".config/fish/functions/ls.fish".source = dotfiles/fish/ls.fish;
      ".config/fish/functions/man.fish".source = dotfiles/fish/man.fish;
      ".config/fish/functions/mv.fish".source = dotfiles/fish/mv.fish;
      ".config/fish/functions/rm.fish".source = dotfiles/fish/rm.fish;
      ".config/fish/functions/p.fish".source = dotfiles/fish/p.fish;
      ".config/fish/functions/ps.fish".source = dotfiles/fish/ps.fish;
      ".config/fish/functions/su.fish".source = dotfiles/fish/su.fish;
      ".config/fish/functions/sudo.fish".source = dotfiles/fish/sudo.fish;
      ".config/fish/functions/t.fish".source = dotfiles/fish/t.fish;
      ".config/fish/functions/vdir.fish".source = dotfiles/fish/vdir.fish;
      ".config/fish/functions/fish_greeting.fish".source = dotfiles/fish/fish_greeting.fish;
    };
  };

}
