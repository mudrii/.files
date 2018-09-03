" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================= Basic Setup =====================

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

set fileformats=unix

"" Status bar
"set laststatus=2

"" Visual Settings
syntax on
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd                 " Show partial commands in status line and

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bn<CR>
noremap <leader>a :ls<CR>

"" Tab navigation
noremap <leader>f :tabn<CR>
noremap <leader>b :tabp<CR>

"" Close buffer
noremap <leader>c :bd<CR>

set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
set showmode                " Display the current mode

set linespace=0                 " No extra spaces between rows
set number                      " Line numbers on
set showmatch                   " Show matching brackets/parenthesis
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set winminheight=0              " Windows can be 0 line high
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set foldenable                  " Auto fold code
"set list


" ================ General Config ====================

set title 											"Set the terminal's title
set number                      "Line numbers are good
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

" splilt windows botoom and right
set splitbelow
set splitright

" set background dark
set background=dark

"turn on syntax highlighting
"syntax on
"set termguicolors
syntax enable

" set nr line highlite
set cursorline

" set color schema
colorscheme material-monokai

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
"let mapleader=","

" Configure spell checking
nmap <silent> <leader>p :set spell!<CR>
set spelllang=en_us

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb
set noshowmode

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set paste

" Fix indentation in file
map <leader>i mmgg=G`m<CR>

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

filetype plugin on
filetype indent on

"Switching to another buffer 
set switchbuf=usetab 
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

" Display tabs and trailing spaces visually
"set list listchars=tab:\ \ ,trail:

" Always wrap long lines:
"set wrap
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" ================ Folds ============================

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**"i"
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

"
" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ================ Search ===========================

"set incsearch       " Find the next match as we type the search
"set hlsearch        " Highlight searches by default
"set ignorecase      " Ignore case when searching...
"set smartcase       " ...unless we type a capital

" Toggle highlighting of search results
nnoremap <leader><space> :nohlsearch<cr>

" ================ Custom Settings ========================
" so ~/vim/settings.vim
