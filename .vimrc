
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
Plugin 'scrooloose/nerdtree'               " Navigate the filesystem
Plugin 'tpope/vim-commentary'              " Comment / uncomment lines
Plugin 'bling/vim-airline'                 " Status bar
Plugin 'octol/vim-cpp-enhanced-highlight'  " C++ highlighting
Plugin 'pangloss/vim-javascript'           " Javascript highlighting
Plugin 'chemzqm/vim-jsx-improve'           " JSX highlighting
Plugin 'exu/pgsql.vim'                     " Postgres highlighting
Plugin 'mattn/emmet-vim'                   " Boilerplate shortcuts
Plugin 'airblade/vim-gitgutter'            " Shows a git diff in the gutter
Plugin 'kien/ctrlp.vim'                    " Fuzzy file, buffer, etc finder
Plugin 'moll/vim-node'                     " Node stuff
Plugin 'tpope/vim-rails'                   " Rails stuff

" All plugins must be added before vundle#end
call vundle#end()

" =============================================================================
" PLUGIN OPTIONS
" =============================================================================
" NERDTree options
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']
let g:NERDTreeWinSize = 20

" Emmet options - enable just for html and css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Ctrl-P options
let g:ctrlp_working_path_mode = 'a'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" psql options -  use psql highlighting for all SQL files
let g:sql_type_default = 'pgsql'

" =============================================================================
" KEYMAPS
" =============================================================================
" Change Caps Lock to Ctrl (not necessary if using HHKB)
" Caps Lock is where Ctrl was on ADM-3A keyboard
" http://xahlee.info/kbd/i_old_keyboard_22509/terminal_ADM-3A_keyboard.jpg

" Possible Esc key map:
" Enter Normal mode with backtick (press Esc for backtick character)
" http://www.economyofeffort.com/media/images/sun-keyboard.png
" inoremap <Esc> `
" inoremap ` <Esc>
" vnoremap <Esc> `
" vnoremap ` <Esc>

" Possible Esc key map:
" Enter Normal mode with Tab -- Tab is where Esc was on ADM-3A keyboard
" http://xahlee.info/kbd/i_old_keyboard_22509/terminal_ADM-3A_keyboard.jpg
" Trade off is removing Ctrl-i jump list because Tab is linked to Ctrl-i
" nnoremap <Tab> <Esc>
" vnoremap <Tab> <Esc>gV
" onoremap <Tab> <Esc>
" inoremap <Tab> <Esc>`^
" inoremap <Esc> <Tab>

" Stops awkward off-by-one repositioning of cursor when leaving Insert
inoremap <Esc> <Esc>`^

" Save with Ctrl-s
" Put stty -ixon in bash_profile to disable ctrl-s and ctrl-q override
nnoremap <C-s> <Esc>:w<CR>
inoremap <C-s> <Esc>:w<CR>

" Compile and execute current file with g++ for C++11
nnoremap <F8> :!g++ --std=c++11 % && ./a.out<CR>

" Delete range without moving cursor:
com! -range D <line1>,<line2>d | norm <C-o>

" Commentary - type \\ to toggle comments
noremap <leader>\ :Commentary<cr>

" ctrl+l to mute search highlighting (and redraw screen)
" From Practical Vim 2 ed.
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" surround word with single quotes \q'
nnoremap <leader>q' ciw''<esc>P
" surround word with double quotes \q"
nnoremap <leader>q" ciw""<esc>P
" remove quotes from word \qd
nnoremap <leader>qd daW"=substitute(@@,"'\\\|\"","","g")<CR>P

" cutting and pasting -- toggle numbers and paste mode
nnoremap <leader>n :set number!<CR>
nnoremap <leader>p :set paste!<CR>

" -------------------------------------
" FILE / BUFFER NAVIGATION KEYMAPS
" -------------------------------------
" netrw: open netrw file browser with \]
nnoremap <leader>] :Explore<CR>

" Cycle open buffers with Ctrl-n and Ctrl-b
nnoremap <C-n> :bnext<CR>
nnoremap <C-b> :bprevious<CR>

" CtrlP: fuzzy buffers use \b instead of Ctrl-p Ctrl-b
noremap <leader>b :CtrlPBuffer<cr>

" NERDTree: toggle nerdtree with with \t
noremap <leader>t :NERDTreeToggle<cr>

" -------------------------------------
" LINE NAVIGATION KEYMAPS
" -------------------------------------
" Navigation - go to line 144: 144 Enter
nnoremap <CR> G

" Normal mode arrow keys up and down scroll half-page up and half-page down
nnoremap <Up> <C-u>
nnoremap <Down> <C-d>

" Normal mode arrow keys left and right scroll half-page left and half-page right
nnoremap <Left> zH
nnoremap <Right> zL

" -------------------------------------
" WINDOW NAVIGATION KEYMAPS
" -------------------------------------
" Possible window navigation keymaps if Tab is not used for Esc or jump list

" Window navigation - use TAB then any other window command ...
" example: TAB h navigate to left window, TAB j navigate to lower window
" noremap <tab> <C-w>

" TAB-TAB to cycle through windows
" noremap <tab><tab> <C-w><C-w>

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
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

