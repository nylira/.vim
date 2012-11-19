set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/ack.vim'
Bundle 'altercation/vim-colors-solarized'
 
filetype plugin indent on     " required!

set exrc
set nu
set fileencodings=utf-8
set scrolloff=999
set history=1000         " remember more commands and search history
set undolevels=1000      
set visualbell           " don't beep
set noerrorbells         " don't beep

" tabs set to 2 spaces
set expandtab
set shiftwidth=4
set softtabstop=4

" solarized
syntax enable
set background=dark
colorscheme solarized
 
" remap
nnoremap <F1> :Explore<cr>
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap ; :
set pastetoggle=<F3>
 
" reset search
nmap <silent> ,/ :nohlsearch<CR>
