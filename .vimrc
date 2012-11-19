set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'mileszs/surround.vim'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'altercation/vim-colors-solarized'
 
filetype plugin indent on     " required!

set exrc
set nu
set hidden
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
nnoremap <F1> :CtrlP<cr>
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap ; :
nnoremap gt :bn<cr>
 
set pastetoggle=<F3>

" reset search
nmap <silent> ,/ :nohlsearch<CR>

" make nerdtree open the old buffer instead of making new ones
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif   

" make ctrl-p open in new tabs by default
" let g:ctrlp_prompt_mappings = {
"     \ 'AcceptSelection("e")': ['<c-t>'],
"     \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"     \ }
