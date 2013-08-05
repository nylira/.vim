set nocompatible
filetype off
set noswapfile

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'zefei/buftabs'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'othree/html5.vim'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'

Bundle 'wavded/vim-stylus'
Bundle 'digitaltoad/vim-jade'
Bundle 'nono/vim-handlebars.git'
Bundle 'kchmck/vim-coffee-script'
Bundle 'gkz/vim-ls'
 
filetype plugin indent on     " required!

set exrc
set hidden
set fileencodings=utf-8
set scrolloff=999
set history=1000         " remember more commands and search history
set undolevels=1000      
set visualbell           " don't beep
set noerrorbells         " don't beep
set nu

" tabs set to 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" solarized
syntax enable
set background=dark
colorscheme solarized
 
" remap
nnoremap <F1> :CtrlP<cr>
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap ; :
nnoremap gt :bn<cr>
 
set pastetoggle=<F3>

" reset search
nmap <silent> ,/ :nohlsearch<CR>

" make nerdtree open the old buffer instead of making new ones
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif   

set hlsearch
