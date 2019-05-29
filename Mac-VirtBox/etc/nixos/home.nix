{ config, pkgs, ... }:

{
  home-manager.users.mudrii = {
    programs.vim = {
      enable = true;
      plugins = [ "vim-airline" "vim-airline-themes" ];
      settings = { ignorecase = true; };
      extraConfig = ''
        let g:airline_powerline_fonts = 1
        if !exists('g:airline_symbols')
          let g:airline_symbols = {}
        endif
        let g:airline_symbols.space = "\ua0"
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline_theme = 'dark'

        set nocompatible

        " Enable filetype plugins
        filetype plugin on
        filetype indent on

        " Turn Off Swap Files
        set noswapfile
        set nobackup
        set nowb
        set noshowmode

        " Encoding
        set encoding=utf-8
        set fileencoding=utf-8
        set fileencodings=utf-8
        set bomb
        set binary
        set ttyfast
        set fileformats=unix
        set t_Co=256

        " General Config
        set title
        set number
        set backspace=indent,eol,start
        set history=1000
        set showcmd
        set showmode
        set gcr=a:blinkon0
        set autoread
        set hidden
        set linespace=0
        set showmatch
        set winminheight=0
        set wildmenu
        set wildmode=list:longest,full
        set whichwrap=b,s,h,l,<,>,[,]

        " For regular expressions turn magic on
        set magic

        " Fast saving
        nmap <leader>w :w!<cr>

        " :W sudo saves the file
        command W w !sudo tee % > /dev/null

        " Scrolling
        set scrolljump=5
        set scrolloff=3
        set sidescrolloff=15
        set sidescroll=1

        " Folds
        set foldenable
        set foldmethod=indent
        set foldnestmax=3
        set nofoldenable
        set foldcolumn=1

        " Always wrap long lines
        set wrap
        set linebreak

        " Fix backspace indent
        set backspace=indent,eol,start

        " Tabs. May be overriten by autocmd rules
        set smarttab
        set shiftwidth=4
        set tabstop=4
        set softtabstop=0
        set shiftwidth=4
        set expandtab

        " Display tabs and trailing spaces visually
        "set list listchars=tab:\ \ ,trail:

        " Status bar
        set laststatus=2

        " Visual Settings
        set background=dark
        syntax on
        syntax enable
        autocmd BufEnter * :syntax sync fromstart
        autocmd BufEnter * :set number
        set ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
        set showcmd
        set visualbell
        set noerrorbells
        set printoptions=paper:letter
        set spelllang=en_us
        set cursorline

        " Highlite color number lign color
        highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
        " DarkGray number line
        highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

        " Splilt windows botoom and right
        set splitbelow
        set splitright

        " Mouse work
        set mouse+=a
        set mousehide
        set showmode

        " Indentation
        set autoindent
        set smartindent

        " Persistent Undo
        if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
          silent !mkdir ~/.vim/backups > /dev/null 2>&1
          set undodir=~/.vim/backups
          set undofile
        endif

        " Search
        set incsearch
        set hlsearch
        set ignorecase
        set smartcase

        " Key Bindings

        " Split
        noremap <Leader>h :<C-u>split<CR>
        noremap <Leader>v :<C-u>vsplit<CR>

        " Buffer nav
        noremap <leader>z :bp<CR>
        noremap <leader>q :bn<CR>
        noremap <leader>a :ls<CR>

        " Useful mappings for managing tabs
        map <leader>tn :tabnew<cr>
        map <leader>to :tabonly<cr>
        map <leader>tc :tabclose<cr>
        map <leader>tm :tabmove
        map <leader>t<leader> :tabnext

        " Close buffer
        noremap <leader>c :bd<CR>

        " Configure spell checking
        nmap <silent> <leader>p :set spell!<CR>

        " Fix indentation in file
        map <leader>i mmgg=G`m<CR>

        " Auto indent pasted text
        nnoremap p p=`]<C-o>
        nnoremap P P=`]<C-o>

        " Toggle highlighting of search results
        nnoremap <leader><space> :nohlsearch<cr>

        " Toggle paste mode on and off
        map <leader>pp :setlocal paste!<cr>

        " Quick timeouts on key combinations.
        set timeoutlen=300

        " Completion
        set wildmode=list:longest
        set wildmenu
        set wildignore=*.o,*.obj,*~
        set wildignore+=*vim/backups*
        set wildignore+=*sass-cache*
        set wildignore+=*DS_Store*
        set wildignore+=vendor/rails/**"i"
        set wildignore+=vendor/cache/**
        set wildignore+=*.gem
        set wildignore+=log/**
        set wildignore+=tmp/**
        set wildignore+=*.png,*.jpg,*.gif

        " Custom Settings
        function! s:DiffWithSaved()
          let filetype=&ft
          diffthis
          vnew | r # | normal! 1Gdd
          diffthis
          exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
        endfunction
        com! Diffs call s:DiffWithSaved()
      '';
    };

    programs.git = {
      enable = true;
      userName  = "mudrii";
      userEmail = "mudreac@gmail.com";
      };

    home.file = {

      ".config/fish/config.fish" = {
        text = ''
          set -g theme_display_git yes
          set -g theme_display_git_dirty yes
          set -g theme_display_git_untracked yes
          set -g theme_display_git_ahead_verbose yes
          set -g theme_display_git_dirty_verbose yes
          set -g theme_display_git_stashed_verbose yes
          set -g theme_display_git_master_branch yes
          set -g theme_git_worktree_support no
          set -g theme_display_vagrant no
          set -g theme_display_docker_machine yes
          set -g theme_display_k8s_context yes
          set -g theme_display_hg no
          set -g theme_display_virtualenv yes
          set -g theme_display_ruby no
          set -g theme_display_user ssh
          set -g theme_display_hostname ssh
          set -g theme_display_vi no
          set -g theme_display_date no
          set -g theme_display_cmd_duration yes
          set -g theme_title_display_process yes
          set -g theme_title_display_path yes
          set -g theme_title_display_user yes
          set -g theme_title_use_abbreviated_path no
          #set -g theme_date_format "+%a %H:%M"
          set -g theme_avoid_ambiguous_glyphs yes
          set -g theme_powerline_fonts yes
          set -g theme_nerd_fonts no
          set -g theme_show_exit_status yes
          #set -g default_user your_normal_user
          set -g theme_color_scheme dark
          set -g fish_prompt_pwd_dir_length 0
          set -g theme_project_dir_length 1
          #set -g theme_newline_cursor yes
          #set -g theme_newline_prompt '$ '

          set -gx GOPATH $HOME/go
          set -gx PATH $PATH $GOPATH/bin

          #set -x EDITOR vim

          set -xU LESS_TERMCAP_md (printf "\e[01;31m")
          set -xU LESS_TERMCAP_me (printf "\e[0m")
          set -xU LESS_TERMCAP_se (printf "\e[0m")
          set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")
          set -xU LESS_TERMCAP_ue (printf "\e[0m")
          set -xU LESS_TERMCAP_us (printf "\e[01;32m")
          
          #export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
          #export LESS='-R'

          function __fish_command_not_found_handler --on-event fish_command_not_found
            command-not-found $argv[1]
          end
        '';
      };

      ".tmux.conf" = {
        text = ''
	  source /nix/store/z1liwldnrf0zxsg0lpfkl00hvdrsb1zj-python3.7-powerline-2.7/share/tmux/powerline.conf
          set-option -g default-shell "/run/current-system/sw/bin/fish"
          
          set -g default-terminal "screen-256color"
          setw -g xterm-keys on
          set -s escape-time 10
          set -sg repeat-time 600
          set -s focus-events on
          
          set -g prefix2 C-a
          bind C-a send-prefix -2
          unbind C-b
          
          set -q -g status-utf8 on
          setw -q -g utf8 on
          
          set -g history-limit 406000
          
          bind r source-file ~/.tmux.conf \; display '~/.tmux.conf sourced'
          
          set -g base-index 1
          setw -g pane-base-index 1
          
          setw -g automatic-rename on
          set -g renumber-windows on
          
          set -g set-titles on
          set -g set-titles-string '#H:#S.#I.#P #W #T'
          
          set -g display-panes-time 800
          set -g display-time 1000
          
          set -g status-interval 10
          
          bind -n C-l send-keys C-l \; run 'sleep 0.1' \; clear-history
          
          set -g monitor-activity on
          set -g visual-activity off
          
          bind C-c new-session
          
          bind C-f command-prompt -p find-session 'switch-client -t %%'
          
          bind - split-window -v
          bind _ split-window -h
          
          bind -r h select-pane -L  # move left
          bind -r j select-pane -D  # move down
          bind -r k select-pane -U  # move up
          bind -r l select-pane -R  # move right
          bind > swap-pane -D       # swap current pane with the next one
          bind < swap-pane -U       # swap current pane with the previous one
          
          bind + run 'cut -c3- ~/.tmux.conf | sh -s _maximize_pane "#{session_name}" #D'
          
          bind -r H resize-pane -L 2
          bind -r J resize-pane -D 2
          bind -r K resize-pane -U 2
          bind -r L resize-pane -R 2
          
          unbind n
          unbind p
          bind -r C-h previous-window
          bind -r C-l next-window
          bind Tab last-window
          
          set -g visual-bell on
          set -g bell-action any
          
          set -g update-environment -r
          
          set -g terminal-overrides 'xterm*:smcup@:rmcup@'
          set -wg xterm-keys       1
          
          set -g status-bg black
          set -g status-fg white
          
          set -g status-left-style fg=green
          
          set -g status-fg white
          set -g status-bg black
          set -g status-style bright
          
          set-window-option -g window-status-style fg=white
          set-window-option -g window-status-style bg=default
          set-window-option -g window-status-style dim
          
          set-window-option -g window-status-current-style fg=white
          set-window-option -g window-status-current-style bg=default
          set-window-option -g window-status-current-style bright
          
          set-window-option -g window-status-current-style bg=red
          
          setw -g monitor-activity on
          set -g visual-activity on
        '';
      };

      ".nanorc" = {
        text = ''
          #set autoindent
          unset backup
          set nonewlines
          set tabsize 4
          set nowrap
        '';
      };
      

      ".config/fish/functions/a.fish" = {
        text = ''
          function a --description 'alias a aws'
            aws  $argv;
          end
        '';
      };

      ".config/fish/functions/ccat.fish" = {
        text = ''
          function ccat --description 'alias ccat pygmentize -f terminal256 -g -P style=monokai'
            pygmentize -f terminal256 -g -P style=monokai $argv;
          end
        '';
      };

      ".config/fish/functions/ccd.fish" = {
        text = ''
          function ccd
            mkdir -p "$argv"
            and cd "$argv"
          end
        '';
      };

      ".config/fish/functions/cp.fish" = {
        text = ''
          function cp --description 'alias cp cp -i'
            command cp -i $argv;
          end
        '';
      };

      ".config/fish/functions/diff.fish" = {
        text = ''
          function diff --description 'alias diff diff --color=auto'
            command diff --color=auto $argv;
          end
        '';
      };

      ".config/fish/functions/dmesg.fish" = {
        text = ''
          function dmesg --description 'alias dmesg dmesg --color=always | less'
            command dmesg --color=always | less $argv;
          end
        '';
      };

      ".config/fish/functions/egrep.fish" = {
        text = ''
          function egrep --description 'alias egrep egrep --color=auto'
            command egrep --color=auto $argv;
          end
        '';
      };

      ".config/fish/functions/fgrep.fish" = {
        text = ''
          function fgrep --description 'alias fgrep fgrep --color=auto'
            command fgrep --color=auto $argv;
          end
        '';
      };

      ".config/fish/functions/fish_user_key_bindings.fish" = {
        text = ''
          # enables $?
          function bind_status
            commandline -i (echo '$status')
          end

          # enables $$
          function bind_self
            commandline -i (echo '%self')
          end

          # enable keybindings
          function fish_user_key_bindings
            bind '$?' bind_status
            bind '$$' bind_self
          end

          function sudobangbang --on-event fish_postexec
              abbr !! sudo $argv[1]
          end

          function bind_bang
            switch (commandline -t)
            case "!"
              commandline -t $history[1]; commandline -f repaint
            case "*"
              commandline -i !
            end
          end

          function bind_dollar
            switch (commandline -t)
            case "!"
              commandline -t ""
              commandline -f history-token-search-backward
            case "*"
              commandline -i '$'
            end
          end

          function fish_user_key_bindings
            bind ! bind_bang
            bind '$' bind_dollar
          end
        '';
      };

      ".config/fish/functions/gad.fish" = {
        text = ''
          function gad --description 'alias git add'
            git add . $argv;
          end
        '';
      };

      ".config/fish/functions/gadcm.fish" = {
        text = ''
          function gadcm --description 'alias git add'
            git add -A; and git commit $argv;
          end
        '';
      };

      ".config/fish/functions/gcm.fish" = {
        text = ''
          function gcm --description 'alias git commit'
            git commit $argv;
          end
        '';
      };

      ".config/fish/functions/gdf.fish" = {
        text = ''
          function gdf --description 'alias git diff'
            git diff $argv;
          end
        '';
      };

      ".config/fish/functions/glg.fish" = {
        text = ''
          function glg --description 'alias git log'
            git log $argv;
          end
        '';
      };

      ".config/fish/functions/gpl.fish" = {
        text = ''
          function gpl --description 'alias git push'
            git pull $argv;
        end
        '';
      };

      ".config/fish/functions/gps.fish" = {
        text = ''
          function gps --description 'alias git push'
            git push $argv;
          end
        '';
      };

      ".config/fish/functions/grep.fish" = {
        text = ''
          function grep --description 'alias grep grep --color=auto'
           command grep --color=auto $argv;
          end
        '';
      };

      ".config/fish/functions/gst.fish" = {
        text = ''
          function gst --description 'alias git status'
            git status $argv;
          end
        '';
      };

      ".config/fish/functions/k.fish" = {
        text = ''
          function k --description 'alias k kubectl'
            kubectl  $argv;
          end
        '';
      };

      ".config/fish/functions/la.fish" = {
        text = ''
          function la --description 'alias la ls -lha --color=auto --group-directories-first'
            ls -lha --color=auto --group-directories-first $argv;
          end
        '';
      };

      ".config/fish/functions/ll.fish" = {
        text = ''
          function ll --description 'alias ll ls -lah'
            ls -lah $argv;
          end
        '';
      };

      ".config/fish/functions/ls.fish" = {
        text = ''
          function ls --description 'alias ls ls --color=auto'
            command ls --color=auto $argv;
          end
        '';
      };
      ".config/fish/functions/mv.fish" = {
        text = ''
          function mv --description 'alias mv mv -i'
            command mv -i $argv;
          end
        '';
      };

      ".config/fish/functions/rm.fish" = {
        text = ''
          function rm --description 'alias rm rm -i'
            command rm -i $argv;
          end
        '';
      };

      ".config/fish/functions/p.fish" = {
        text = ''
          function p --description 'alias p python'
            python  $argv;
          end
        '';
      };

      ".config/fish/functions/ps.fish" = {
        text = ''
          function ps --description 'alias ps -ef'
            command ps -ef $argv;
          end
        '';
      };

      ".config/fish/functions/su.fish" = {
        text = ''
          function su
           command su --shell=/usr/bin/fish $argv
          end        '';
      };

      ".config/fish/functions/sudo.fish" = {
        text = ''
          function sudo --description 'alias sudo sudo -i'
            command sudo -i $argv;
          end
        '';
      };

      ".config/fish/functions/t.fish" = {
        text = ''
          function t --description 'alias t terraform'
            terraform  $argv;
          end
        '';
      };

      ".config/fish/functions/vdir.fish" = {
        text = ''
          function vdir --description 'alias vdir vdir --color=auto'
            command vdir --color=auto $argv;
          end
        '';
      };
      
      ".config/fish/functions/fish_greeting.fish" = {
        text = ''
          function fish_greeting.fish; end
        '';
      };

    };

  };
}
