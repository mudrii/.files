{ config, pkgs, ... }:

{

  imports = [
    ./dotfiles/.tmux.conf.nix
  ];

  home-manager.users.mudrii = {
    programs = {
      direnv.enable = true;
      home-manager = {
        enable = true;
        path = [ pkgs.user-environment ];
      };

      vim = {
        enable = true;
        settings = { ignorecase = true; };
        extraConfig = builtins.readFile dotfiles/.vimrc;
        plugins = with pkgs.vimPlugins; [
          vim-airline
          vim-airline-themes
          nerdtree
          ctrlp-vim
          vim-fugitive
          fzf-vim
          syntastic
        ];
      };

      neovim = {
        enable = true;
        extraConfig = builtins.readFile dotfiles/.vimrc;
        plugins = with pkgs.vimPlugins; [ 
          vim-airline
          vim-airline-themes
          nerdtree
          ctrlp-vim
          vim-fugitive
          fzf-vim
          syntastic
        ];
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
    };

#    home.sessionVariables.LESS = "-R";

    home.file = {
      ".bashrc".source = dotfiles/.bashrc;
      ".inputrc".source = dotfiles/.inputrc;
      ".dircolors".source = dotfiles/.dircolors;
      ".git-completion.bash".source = dotfiles/.git-completion.bash;
      ".git-prompt.sh".source = dotfiles/.git-prompt.sh;
      ".config/neofetch/config.conf".source  = dotfiles/config.conf;
      ".Xresources".source = dotfiles/.Xresources;
      ".config/i3/config".source = dotfiles/config;
      ".config/i3/start_w1.sh".source = dotfiles/start_w1.sh;
      ".config/i3/start_w2.sh".source = dotfiles/start_w2.sh;
      ".config/i3/start_w3.sh".source = dotfiles/start_w3.sh;
      ".config/i3/start_w4.sh".source = dotfiles/start_w4.sh;
      ".config/i3/start_w5.sh".source = dotfiles/start_w5.sh;
      ".config/i3/start_w6.sh".source = dotfiles/start_w6.sh;
      ".config/i3/workspace_1.json".source = dotfiles/workspace_1.json;
      ".config/i3/workspace_2.json".source = dotfiles/workspace_2.json;
      ".config/i3/workspace_3.json".source = dotfiles/workspace_3.json;
      ".config/i3/workspace_4.json".source = dotfiles/workspace_4.json;
      ".config/i3/workspace_5.json".source = dotfiles/workspace_5.json;
      ".config/i3/workspace_6.json".source = dotfiles/workspace_6.json;
      ".config/i3status-rs/config.toml".source = dotfiles/config.toml;
      ".config/networkmanager-dmenu/config.ini".source = dotfiles/config.ini;
      ".config/conky/conky.conf".source = dotfiles/conky.conf;
      ".config/nixpkgs/config.nix".source = dotfiles/config.nix;
      ".config/ranger/commands_full.py".source = dotfiles/ranger/commands_full.py;
      ".config/ranger/commands.py".source = dotfiles/ranger/commands.py;
      ".config/ranger/rc.conf".source = dotfiles/ranger/rc.conf;
      ".config/ranger/rifle.conf".source = dotfiles/ranger/rifle.conf;
      ".config/ranger/scope.sh".source = dotfiles/ranger/scope.sh;
      ".config/fish/config.fish".source = dotfiles/fish/config.fish;
      ".config/fish/functions/fish_user_key_bindings.fish".source = dotfiles/fish/fish_user_key_bindings.fish;
      ".config/fish/functions/fish_greeting.fish".source = dotfiles/fish/fish_greeting.fish;
    };
  };

}

