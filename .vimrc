"----------------------------------------------------------------------
" Bundle Management: NeoBundle
"----------------------------------------------------------------------

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#rc(expand('~/.vim/bundle/'))

" Required: Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'zefei/buftabs'

" syntax highlighting and support
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'gkz/vim-ls'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wavded/vim-stylus'

filetype plugin indent on     " required!
 
" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"----------------------------------------------------------------------
" Settings: Main
"----------------------------------------------------------------------

set exrc
set hidden                " allow buffers to be switched w/o saving
set fileencodings=utf-8
set scrolloff=999
set history=1000          " remember more commands and search history
set undolevels=1000       " undo all the things
set visualbell            " don't beep
set noerrorbells          " don't beep
set nu                    " use line numbers
set hlsearch              " highlight text matching pattern
set noswapfile            " don't use swapfiles

" Indentation
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set backspace=indent,eol,start    " fix backspace

"----------------------------------------------------------------------
" Color Scheme: Solarized
"----------------------------------------------------------------------

syntax on
set background=dark
set t_Co=16
colorscheme solarized
 
"----------------------------------------------------------------------
" Key Bindings: General
"----------------------------------------------------------------------
nnoremap <F1> :Unite buffer file_rec<cr>
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap ; :
nnoremap gt :bn<cr>
nnoremap Gt :bp<cr>
set pastetoggle=<F3>
nmap <silent> ,/ :nohlsearch<CR>    " clear highlighted text

"----------------------------------------------------------------------
" Settings: Miscellaneous
"----------------------------------------------------------------------

" make nerdtree open the old buffer instead of making new ones
 au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif   

" Makefile - tab instead of space"
autocmd FileType make setlocal noexpandtab

" livescript autocompile
au BufWritePost *.ls silent LiveScriptMake! -d | cwindow | redraw!

" make long lines slightly indented
let &showbreak=repeat(' ', 2)

" auto reload .vimrc
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
