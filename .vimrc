" --------------------------------------------------------------------------/
" General
" ---------------------------------------------------------------------------

set nocompatible                  " Must come first because it changes other options.
filetype off
" ---------------------------------------------------------------------------
" Plug-in Manager
" ---------------------------------------------------------------------------

" Vundle Installation:
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

" ---------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------
Plugin 'airblade/vim-gitgutter'          " shows a git diff in the gutter
Plugin 'bling/vim-airline'               " status bar/tabline
Plugin 'digitaltoad/vim-jade'            " Jade template engine syntax highlighting and indention
Plugin 'kchmck/vim-coffee-script'        " CoffeeScript support
Plugin 'kien/ctrlp.vim'                  " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'moll/vim-node'                   " Tools for Node
Plugin 'scrooloose/nerdtree'             " A tree explorer plugin for navigating the filesystem
Plugin 'thoughtbot/vim-rspec'            " Lightweight RSpec runner for Vim
Plugin 'tpope/vim-bundler'               " Lightweight support for Ruby's Bundler
Plugin 'tpope/vim-commentary'            " Use gcc to comment out a line
Plugin 'tpope/vim-endwise'               " wisely add 'end' in ruby etc
Plugin 'tpope/vim-haml'                  " runtime files for Haml, Sass, and SCSS
Plugin 'tpope/vim-projectionist'         " project configuration
Plugin 'tpope/vim-rails'                 " Ruby on Rails power tools
Plugin 'tpope/vim-rake'                  " it's like rails.vim without the rails
Plugin 'tpope/vim-repeat'                " enable repeating supported plugin maps with '.'
Plugin 'tpope/vim-sensible'              " Defaults everyone can agree on
Plugin 'tpope/vim-surround'              " quoting/parenthesizing made simple
Plugin 'tpope/vim-unimpaired'            " pairs of handy bracket mappings
Plugin 'mattn/emmet-vim'                 " boilerplate shortcuts
Plugin 'pangloss/vim-javascript'         " javascript highlighting
Plugin 'chemzqm/vim-jsx-improve'         " jsx highlighting

" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'ChrisKempson/Vim-Tomorrow-Theme'
Plugin 'croaky/vim-colors-github'
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'

" All of your Plugins must be added before the following line
call vundle#end()                 " required

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

"--------------Plugin Options: Commentary ----------"
noremap <leader>/ :Commentary<cr>
"---------------------------------------------------"

" Brief help
" :PluginList                     - list configured plugins
" :PluginInstall(!)               - install (update) plugins
" :PluginSearch(!) foo            - search (or refresh cache first) for foo
" :PluginClean(!)                 - confirm (or auto-approve) removal of unused plugins

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" ----------------------------------------------------------------------------
"  UI
" ----------------------------------------------------------------------------
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set ruler                         " Show cursor position.
set number                        " Show line numbers.
set noshowmode                    " airline.vim takes care of this
set backspace=indent,eol,start    " Intuitive backspacing.
set wildmenu                      " Hitting TAB will show possible completions
set wildchar=<Tab>                " Expand the command line using tab
set autoread                      " Reread file when changed from outside of Vim
set foldcolumn=0                  " Add a bit of extra margin to the left
set cursorline                    " Highlight current line
set title                         " Show filename in window title bar
" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

"----COLORSCHEME------
colorscheme gruvbox 
set background=dark
"--------------------

" ----------------------------------------------------------------------------
" Navigation
" ----------------------------------------------------------------------------

" create horizontal & vertical splits
noremap <leader>h :sp<cr>
noremap <leader>v :vsp<cr>

" window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" tab navigation
noremap <C-t> :tabn<cr>
noremap <C-n> :tabnew<cr>

" ----------------------------------------------------------------------------
" Visual Cues
" ----------------------------------------------------------------------------
set showmatch                                 " brackets/braces that is
set showcmd                                   " display incomplete commands
set laststatus=2                              " Show the status line all the time
set visualbell                                " No beeping.
set smartcase                                 " When searching be smart about cases
set incsearch                                 " Highlight matches as you type.
set hlsearch                                  " Highlight search results
set list                                      " Show hidden characters (tab and eol)
"set listchars=trail:⋅,nbsp:⋅,tab:▸\ ,eol:¬    " Use the same chars as textmate.

"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" ----------------------------------------------------------------------------
" Text Formatting
" ----------------------------------------------------------------------------

set autoindent                  " automatic indent new lines
set smartindent                 " be smart about it
set nowrap                      " do not wrap lines
set tabstop=2                   " Global tab width.
set shiftwidth=2                " And again, related.
set expandtab                   " Use spaces instead of tabs
set textwidth=80                " wrap at 80 chars by default

" Character encoding
scriptencoding utf-8
set encoding=utf8

" ----------------------------------------------------------------------------
"  Mappings
" ----------------------------------------------------------------------------

let mapleader = ","               " Remap default leader key from `/`.

imap >> →
imap << ←
imap ^^ ↑
imap VV ↓

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

" ---------------------------------------------------------------------------
" NERDTree
" ---------------------------------------------------------------------------

noremap <leader>n :NERDTreeToggle<cr>               " open nerdtree with leader + n

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" ---------------------------------------------------------------------------
" Ctrl-P
" ---------------------------------------------------------------------------

noremap <leader>p :CtrlP<cr>           " to find files using ctrlp
noremap <leader>b :CtrlPBuffer<cr>     " to find buffers using ctrlp
let g:ctrlp_working_path_mode = 'a'    " sets the working directory for ctrl
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" ---------------------------------------------------------------------------
" RSpec.vim mappings
" ---------------------------------------------------------------------------

map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>s :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>

" ---------------------------------------------------------------------------
" Themes
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
