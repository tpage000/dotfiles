" =============================================================================
" VIMRC
" =============================================================================
"                 *** find colorscheme at end of file ***

" =============================================================================
" PLUGIN MANAGER
" =============================================================================
" required by Vundle plugin manager
filetype off  

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'        

" =============================================================================
" PLUGINS
" =============================================================================
" Themes
Plugin 'sjl/badwolf'
Plugin 'morhetz/gruvbox'
Plugin 'rakr/vim-one'

" Other
Plugin 'scrooloose/nerdtree'              " Navigate the filesystem
Plugin 'tpope/vim-commentary'             " Comment / uncomment lines
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'                " Status bar
Plugin 'octol/vim-cpp-enhanced-highlight' " C++ highlighting
Plugin 'pangloss/vim-javascript'          " Javascript highlighting
Plugin 'leafgarland/typescript-vim'       " Typescript highlighting 
Plugin 'chemzqm/vim-jsx-improve'          " JSX highlighting
Plugin 'exu/pgsql.vim'                    " Postgres highlighting
Plugin 'travitch/hasksyn'                 " Haskell highlighting
Plugin 'mattn/emmet-vim'                  " Boilerplate shortcuts
" Plugin 'airblade/vim-gitgutter'           " Shows a git diff in the sign column
Plugin 'kien/ctrlp.vim'                   " Fuzzy file, buffer, etc finder
Plugin 'moll/vim-node'                    " Node stuff
Plugin 'tpope/vim-rails'                  " Rails stuff
Plugin 'jiangmiao/auto-pairs'             " Autocomplete matching braces, etc.
Plugin 'mustache/vim-mustache-handlebars'

" All plugins must be added before vundle#end
call vundle#end()

" =============================================================================
" PLUGIN OPTIONS
" =============================================================================
" NERDTree options
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let g:NERDTreeWinSize = 35
let NERDTreeShowHidden=1

" Emmet options - enable just for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ctrl-P options
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = { 'dir': '.git$|build$\|node_modules$' }

" psql options -  use psql highlighting for all SQL files
let g:sql_type_default = 'pgsql'

" =============================================================================
" KEYMAPS
" =============================================================================
let mapleader = "\<Space>"

" Stops awkward off-by-one repositioning of cursor when leaving Insert
inoremap <Esc> <Esc>`^

" Save with Ctrl-s
" Put stty -ixon in bash_profile to disable ctrl-s and ctrl-q override
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>

" Commentary
noremap <leader><leader> :Commentary<cr>

" Add newline above or below without leaving normal mode
nnoremap - O<Esc>j
nnoremap + o<Esc>k 

" ctrl+l to mute search highlighting (and redraw screen)
" From Practical Vim 2 ed.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" cutting and pasting -- toggle numbers and paste mode
nnoremap <leader>n :set number!<CR>
nnoremap <leader>p :set paste!<CR>

" -------------------------------------
" FILE / BUFFER NAVIGATION KEYMAPS
" -------------------------------------
" netrw toggling
nnoremap <leader>e :Explore<CR>
" nnoremap <leader><Space> <C-^>

" Cycle open buffers with Ctrl-n and Ctrl-b
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprevious<CR>

" Delete current buffer
nnoremap <leader>d :bdelete<CR>

" NERDTree: toggle nerdtree
noremap <leader>t :NERDTreeToggle<cr>

" Alternative buffer
noremap \ <C-^>
 
" -------------------------------------
" LINE NAVIGATION KEYMAPS
" -------------------------------------
" Navigation - go to line 144: 144 Enter
nnoremap <CR> G

" Normal mode arrow keys up and down scroll line by line
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>

" Normal mode arrow keys left and right scroll half-page left and half-page right
nnoremap <Left> zH
nnoremap <Right> zL

" -------------------------------------
" WINDOW RESIZING KEYMAPS
" -------------------------------------
" Vertical window resizing
nnoremap <S-Right> <C-w>>
nnoremap <S-Left> <C-w><
nnoremap <leader><Right> :vertical resize 94<cr>
nnoremap <leader><Left> :vertical resize 46<cr>

" Horizontal window resizing
nnoremap <leader><Up> :resize 30<cr>
nnoremap <leader><Down> :resize 10<cr>

" Open vertical split, resize original window, open split window on netrw
nnoremap <F8> :vsp<cr><C-w><C-w>:vertical resize 96<cr><C-w><C-w>:Ex<cr>

" -------------------------------------
" QUICK COMPILES
" -------------------------------------
" C++ compile current file with GNU for C++11, and execute
nnoremap <F10> :!g++ --std=c++11 % && ./a.out<CR>

" Haskell compile current file with GHC, and execute
nnoremap <F9> :!ghc % && src/Main<CR>

" ------------------------------------
"  NEVER USED
" ------------------------------------
" Delete range without moving cursor:
com! -range D <line1>,<line2>d | norm <C-o>

" CtrlP: fuzzy buffers use \b instead of Ctrl-p Ctrl-b
noremap <leader>b :CtrlPBuffer<cr>

" surround word with single quotes \q'
nnoremap <leader>q' ciw''<esc>P

" surround word with double quotes \q"
nnoremap <leader>q" ciw""<esc>P

" remove quotes from word \qd
nnoremap <leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" =============================================================================
" UI
" =============================================================================
syntax enable                     " Turn on syntax highlighting
filetype plugin indent on         " Turn on file type detection

" Visuals 
set ruler                         " Show cursor position
set number                        " Show line numbers
set noshowmode                    " use airline.vim status bar instead
set foldcolumn=0                  " Add a bit of extra margin to the left
set cursorline                    " Highlight current line
set title                         " Show filename in window title bar
set showmatch                     " match brackets/braces
set showcmd                       " display incomplete commands
set laststatus=2                  " Show the status line all the time
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight search results
set list                          " Show hidden characters
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Behavior
set backspace=indent,eol,start    " Intuitive backspacing
set wildmenu                      " Hitting TAB will show possible completions
set wildchar=<Tab>                " Expand the command line using tab
set autoread                      " Reread file when changed from outside of Vim
set splitbelow                    " Open new split panes to right and bottom
set splitright                    " Open new split panes to right and bottom
set visualbell                    " No beep
set smartcase                     " When searching be smart about cases

" Text Formatting
set autoindent
set nowrap
set tabstop=2
set expandtab
set shiftwidth=2

" Set tab to 4 spaces for Python
autocmd BufRead,BufNewFile *.py set tabstop=4 shiftwidth=4 softtabstop=4
" Use Javascript syntax highlighting for Typescript files
" au BufEnter,BufRead *.ts set filetype=javascript

" Character encoding
scriptencoding utf-8
set encoding=utf8

" =============================================================================
" OTHER
" =============================================================================
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

" =============================================================================
" COLOR SCHEME
" =============================================================================
" set background before colorscheme to get proper syntax highlighting
set background=dark  
colorscheme one

" colorcolumn must be added after colorscheme, otherwise column disappears
set colorcolumn=90
highlight ColorColumn ctermbg=0 guibg=lightgrey

