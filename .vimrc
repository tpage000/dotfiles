" --------------------------------------------------------------------------/
" General
" ---------------------------------------------------------------------------

set nocompatible                  " Vim stuff, not Vi stuff.

" --------------------------------------------------------------------------/
" Plugin Manager
" ---------------------------------------------------------------------------
filetype off                      " Needed for Vundle

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
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'joshdick/onedark.vim'
" Other
Plugin 'airblade/vim-gitgutter'          " shows a git diff in the gutter
Plugin 'bling/vim-airline'               " status bar/tabline
Plugin 'kien/ctrlp.vim'                  " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'moll/vim-node'                   " Tools for Node
Plugin 'scrooloose/nerdtree'             " A tree explorer plugin for navigating the filesystem
Plugin 'tpope/vim-commentary'            " Use gcc to comment out a line
Plugin 'mattn/emmet-vim'                 " boilerplate shortcuts
Plugin 'pangloss/vim-javascript'         " javascript highlighting
Plugin 'chemzqm/vim-jsx-improve'         " jsx highlighting
Plugin 'elzr/vim-json'
Plugin 'tpope/vim-rails'                 " Ruby on Rails power tools

" All plugins must be added before vundle#end
call vundle#end()

if VundleExists == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

"----------------------------------------------------
"                    Plugin Options
"----------------------------------------------------

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" ---------------------------------------------------------------------------
" Ctrl-P
" ---------------------------------------------------------------------------

let g:ctrlp_working_path_mode = 'a'    " sets the working directory for ctrl
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" ---------------------------------------------------------------------------
" Airline symbols
" ---------------------------------------------------------------------------
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" PLUGINS
" :PluginList                     - list configured plugins
" :PluginInstall                  - install plugins
" :PluginUpdate                   - update plugin list (if removing plugins)
" :PluginClean(!)                 - confirm (or auto-approve) removal of unused plugins

" ////////////////////////////////////////////////////////////////////////////
" ////////////////////////////////////////////////////////////////////////////
" ////////////////////////////////////////////////////////////////////////////
"-----------------------------------------------------------------------------
"                              KEYMAPS
" ----------------------------------------------------------------------------

" Commentary: type \\ to toggle commenting or uncommenting
noremap <leader>\ :Commentary<cr>

" NERDTree: open nerdtree with with leader + n    \n
noremap <leader>n :NERDTreeToggle<cr>

" CtrlP: \p and \b 
noremap <leader>p :CtrlP<cr>           " to find files using ctrlp
noremap <leader>b :CtrlPBuffer<cr>     " to find buffers using ctrlp

" ----------------------------------------------------------------------------
" Navigation
" ----------------------------------------------------------------------------
" go to line 144: 144 Enter
nnoremap <CR> G

" create horizontal & vertical splits
noremap <leader>h :sp<cr>
noremap <leader>v :vsp<cr>

" window navigation - one way to do it: ctrl+direction
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" window navigation - use <tab>
" tab then any other window command ...
noremap <tab> <C-w>
" tab tab to cycle through windows
noremap <tab><tab> <C-w><C-w>

" ----------------------------
" Other Useful Maps
" ----------------------------
" Delete range without moving cursor:
com! -range D <line1>,<line2>d | norm <C-o>

" remove search highlighting when press esc
nnoremap <esc> :noh<CR><esc>

" ////////////////////////////////////////////////////////////////////////////
" ////////////////////////////////////////////////////////////////////////////
" ////////////////////////////////////////////////////////////////////////////
" ----------------------------------------------------------------------------
"                                        UI
" ----------------------------------------------------------------------------
syntax enable                     " Turn on syntax highlighting
filetype plugin indent on         " Turn on file type detection

"-----------------------------------------
" Color Scheme
"-----------------------------------------
set t_Co=256
set background=dark
colorscheme onedark 

" ----------------------------------------------------------------------------
" Visuals 
" ----------------------------------------------------------------------------
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

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------
set autoindent                  " indent new lines
set smartindent                 " be smart about automatic indentation
set nowrap                      " do not wrap lines
set tabstop=2                   " Global tab width.
set shiftwidth=2                " And again, related.
set expandtab                   " Use spaces instead of tabs
set textwidth=80                " wrap at 80 chars by default

" Character encoding
scriptencoding utf-8
set encoding=utf8

"/////////////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////////////
"/////////////////////////////////////////////////////////////////////////////
" ---------------------------------------------------------------------------
" OTHER
" ---------------------------------------------------------------------------
" ---------------------------------------------------------------------------
"  Strip all trailing whitespace in file
" ---------------------------------------------------------------------------

" http://stackoverflow.com/questions/356126/how-can-you-automatically-remove-trailing-whitespace-in-vim/1618401#1618401
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" ---------------------------------------------------------------------------
" Speed up transition from modes
" ---------------------------------------------------------------------------

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
  autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
    augroup END
endif

