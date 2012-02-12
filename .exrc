" This must be first, because it changes other options as side effect
set nocompatible
"
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
"
" Hide buffers instead of closing them
set hidden
"
" Set leader key
let mapleader = ","
"
set exrc
set nu
set fileencodings=utf-8
set scrolloff=999
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
"
" tab settings
"
set tabstop=2     " a tab is two spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=2  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set softtabstop=2
set expandtab
set cindent
set cinkeys=0{,0},:,!^F
"
" Break lines intelligently when wrapping
set linebreak
set display+=lastline
"
" syntax colors with solarized
syntax enable
set background=dark
colorscheme solarized
"
" file navigation
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F1> :CommandT<cr>
" semicolon instead of colon for most commands
nnoremap ; :
"
" turn off autoindent and crap for pasting
set pastetoggle=<F3>
"
" clear highlighted searches without 'sdoifnsd'
nmap <silent> ,/ :nohlsearch<CR>

" tell vim to keep a backup file
set backup

" tell vim where to put its backup files
set backupdir=/home/ari/tmp

" tell vim where to put swap files
set dir=/home/ari/tmp
" more syntax highlighting
au BufReadPost *.styl set syntax=stylus
