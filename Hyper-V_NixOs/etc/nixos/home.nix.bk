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
  };
}
