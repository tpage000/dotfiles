" ---------------------------------------------------------------------------
"                                   GENERAL
" ---------------------------------------------------------------------------
"                 *** find colorscheme at end of file ***

set nocompatible   " Vim stuff, not Vi stuff.

" ---------------------------------------------------------------------------
"                                PLUGIN MANAGER
" ---------------------------------------------------------------------------
filetype off  " Needed for Vundle

" Vundle Installation:
let VundleExists=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let VundleExists=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------
" Themes
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'
Plugin 'dracula/vim'
" Other
Plugin 'scrooloose/nerdtree'               " Navigate the filesystem
Plugin 'tpope/vim-commentary'              " Comment / uncomment lines
Plugin 'bling/vim-airline'                 " Status bar
Plugin 'octol/vim-cpp-enhanced-highlight'  " C++ highlighting
Plugin 'pangloss/vim-javascript'           " Javascript highlighting
Plugin 'chemzqm/vim-jsx-improve'           " JSX highlighting
Plugin 'exu/pgsql.vim'                     " Postgres highlighting
Plugin 'mattn/emmet-vim'                   " Boilerplate shortcuts
Plugin 'airblade/vim-gitgutter'            " Shows a git diff in
Plugin 'kien/ctrlp.vim'                    " Fuzzy file, buffer, etc finder
Plugin 'moll/vim-node'                     " Node stuff
Plugin 'tpope/vim-rails'                   " Rails stuff

" All plugins must be added before vundle#end
call vundle#end()

if VundleExists == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

"-----------------------------------------------------------------------------
"                                PLUGIN OPTIONS
"-----------------------------------------------------------------------------
" NERDTree
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let g:NERDTreeWinSize = 20

" Emmet - enable just for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ctrl-P
let g:ctrlp_working_path_mode = 'a'    " sets the working directory
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" use psql highlighting for all SQL files
let g:sql_type_default = 'pgsql'

"-----------------------------------------------------------------------------
"                 FILE / BUFFER NAVIGATION KEYMAPS
" ----------------------------------------------------------------------------
" netrw: open netrw with \]
nnoremap <leader>] :Ex<CR>

" Cycle open buffers with Ctrl-n and Ctrl-b
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprevious<CR>

" CtrlP: \p and \b 
noremap <leader>p :CtrlP<cr>           "find files \p
noremap <leader>b :CtrlPBuffer<cr>     "find buffers \b

" NERDTree: toggle nerdtree with with \n
noremap <leader>n :NERDTreeToggle<cr>

"-----------------------------------------------------------------------------
"                 LINE NAVIGATION KEYMAPS
" ----------------------------------------------------------------------------
" Navigation - go to line 144: 144 Enter
nnoremap <CR> G

" Home key and End key scroll half-page up and half-page down
nnoremap <Home> <C-u>
nnoremap <End> <C-d>

"-----------------------------------------------------------------------------
"                 WINDOW NAVIGATION KEYMAPS
" ----------------------------------------------------------------------------
" Window navigation - use TAB then any other window command ...
" example: TAB h navigate to left window, TAB j navigate to lower window
noremap <tab> <C-w>

" TAB-TAB to cycle through windows
noremap <tab><tab> <C-w><C-w>

"-----------------------------------------------------------------------------
"                       OTHER USEFUL KEYMAPS 
" ----------------------------------------------------------------------------
" Compile and execute current file (C++)
nnoremap <F8> :!clang++ % && ./a.out<CR>

" Delete range without moving cursor:
com! -range D <line1>,<line2>d | norm <C-o>

" Commentary: type \\ to toggle comments
noremap <leader>\ :Commentary<cr>

" ctrl+h to toggle highlight.
let hlstate=0
nnoremap <c-h> :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

" surround word with single quotes \q'
nnoremap <leader>q' ciw''<esc>P
" surround word with double quotes \q"
nnoremap <leader>q" ciw""<esc>P
" remove quotes from word \qd
nnoremap <leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" ----------------------------------------------------------------------------
"                                        UI
" ----------------------------------------------------------------------------
syntax enable                     " Turn on syntax highlighting
filetype plugin indent on         " Turn on file type detection

" Visuals 
set ruler                         " Show cursor position
set number                        " Show line numbers
set noshowmode                    " use airline.vim status bar instead
set backspace=indent,eol,start    " Intuitive backspacing.
set wildmenu                      " Hitting TAB will show possible completions
set wildchar=<Tab>                " Expand the command line using tab
set autoread                      " Reread file when changed from outside of Vim
set foldcolumn=0                  " Add a bit of extra margin to the left
set cursorline                    " Highlight current line
set title                         " Show filename in window title bar
set splitbelow                    " Open new split panes to right and bottom
set splitright                    " Open new split panes to right and bottom
set showmatch                     " match brackets/braces
set showcmd                       " display incomplete commands
set laststatus=2                  " Show the status line all the time
set visualbell                    " No beep
set smartcase                     " When searching be smart about cases
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight search results
set list                          " Show hidden characters (tab and eol)

" Make hidden characters look nicer (removes eol $)
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" Text Formatting
set autoindent                  " indent new lines
set smartindent                 " be smart about automatic indentation
set nowrap                      " do not wrap lines
set tabstop=2                   " Global tab width.
set shiftwidth=2                " And again, related.
set expandtab                   " Use spaces instead of tabs
" set textwidth=80                " wrap at 80 chars by default

" Character encoding
scriptencoding utf-8
set encoding=utf8

" ---------------------------------------------------------------------------
" OTHER
" ---------------------------------------------------------------------------
" Strip all trailing whitespace in file
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
  autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
    augroup END
endif

"----------------------------------------------------------------------------
" COLOR SCHEME
"----------------------------------------------------------------------------
set background=dark  " set background before colorscheme to get full highlighting
colorscheme one 

" colorcolumn must be added after colorscheme set, otherwise it disappears
set colorcolumn=80   " Adds line down column 80
highlight ColorColumn ctermbg=0 guibg=lightgrey

