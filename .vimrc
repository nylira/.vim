set nocompatible
filetype off
set noswapfile

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'
Bundle 'othree/html5.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'zefei/buftabs'

" syntax highlighting and support
Bundle 'digitaltoad/vim-jade'
Bundle 'gkz/vim-ls'
Bundle 'kchmck/vim-coffee-script'
Bundle 'nono/vim-handlebars.git'
Bundle "pangloss/vim-javascript"
Bundle 'slim-template/vim-slim'
Bundle 'wavded/vim-stylus'
 
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
syntax on
set background=dark
set t_Co=16
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

" skip over parens with tab key
inoremap <expr> <Tab> SkipClosingParentheses()
 
function! SkipClosingParentheses()
  let line = getline('.')
  let current_char = line[col('.')-1]
 
  "Ignore EOL
  if col('.') == col('$')
    return "\t"
  end
 
  return stridx(']})', current_char)==-1 ? "\t" : "\<Right>"
endfunction

"use tab instead of spaces for makefiles"
autocmd FileType make setlocal noexpandtab
