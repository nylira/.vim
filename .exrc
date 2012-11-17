set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'wavded/vim-stylus'
Bundle 'scrooloose/nerdtree'
Bundle 'altercation/vim-colors-solarized'
 
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" solarized
syntax enable
set background=dark
colorscheme solarized
 
" remap
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap <F1> :CtrlP<cr>
nnoremap ; :
set pastetoggle=<F3>
 
" reset search
nmap <silent> ,/ :nohlsearch<CR>

" more syntax highlighting
au BufReadPost *.styl set syntax=stylus
