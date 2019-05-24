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

          export LESSOPEN='|pygmentize -f terminal256 -g -P style=monokai %s'
          export LESS='-R'

          function __fish_command_not_found_handler --on-event fish_command_not_found
            command-not-found $argv[1]
          end
        '';
      };

      ".tmux.conf" = {
        text = ''
          source /nix/store/y2cvqipzyl32h1hlk6f4i2w24p2fk0c6-python3.7-powerline-2.7/lib/python3.7/site-packages/powerline/bindings/tmux/powerline.conf
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

    };

  };
}