" Use Vim settings, rather then Vi settings (much better!).

let g:powerline_pycmd="py3"
let g:Powerline_symbols = "fancy"
"set rtp+=/usr/lib/python3.7/site-packages/powerline/segments/vim/
set laststatus=2
set t_Co=256

" This must be first, because it changes other options as a side effect.
set nocompatible

"" Enable filetype plugins
filetype plugin on
filetype indent on

"" Turn Off Swap Files
set noswapfile
set nobackup
set nowb
set noshowmode

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast
set fileformats=unix

" ================ General Config ====================

set title						" Set the terminal's title
set number              	    " Line numbers on
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Store lots of :cmdline history
set showcmd                     " Show incomplete cmds down the bottom
set showmode                    " Show current mode down the bottom
set gcr=a:blinkon0              " Disable cursor blink
set autoread                    " Reload files changed outside vim
set hidden						" Buffers can exist in the background without being in a window
set linespace=0             	" No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set paste
set list

" For regular expressions turn magic on
set magic

"" With a map leader it's possible to do extra key combinations
"" like <leader>w saves the current file
"let mapleader = ","
"let g:mapleader = ","

"" Fast saving
nmap <leader>w :w!<cr>

"" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

"" Scrolling
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor
set sidescrolloff=15
set sidescroll=1

"" Folds
set foldenable          " Auto fold code
set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Dont fold by default
set foldcolumn=1		" Add a bit extra margin to the left

"" Always wrap long lines:
set wrap
"set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

"" Status bar
"set laststatus=2

"" Visual Settings
set background=dark
syntax on 		" Turn on syntax highlighting
syntax enable
autocmd BufEnter * :syntax sync fromstart
autocmd BufEnter * :set number
set ruler 		"Always show current position
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
set showcmd     " Show partial commands in status line and

"set cursorline		" set nr line highlite
"colorscheme material-monokai	" set color schema from ~/.vim/colors

set visualbell
set noerrorbells
set printoptions=paper:letter

set spelllang=en_us

"set shiftwidth=2

set cursorline " set nr line highlite
" Highlite color number lign color
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
" DarkGray number line
highlight LineNr term=bold cterm=NONE ctermfg=DarkGray ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"" Splilt windows botoom and right
set splitbelow
set splitright

"" Mouse work
"set mouse=a
set mouse+=a 	             	" Automatically enable mouse usage
set mousehide    	           	" Hide the mouse cursor while typing
set showmode         	       	" Display the current mode

"" Indentation
"set ai "Auto indent
"set si "Smart indent
set autoindent
set smartindent


" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital


" ================ Key Bindings ====================

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Buffer nav
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

" ================ Custom Settings ========================
" so ~/vim/settings.vim

" to view diff in git stile :w !git diff  % -
" see historical and current changes :changes
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffs call s:DiffWithSaved()

