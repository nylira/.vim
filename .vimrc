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
NeoBundle 'zefei/buftabs'

" syntax highlighting and support
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'gkz/vim-ls'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'wavded/vim-stylus'
 
filetype off
set noswapfile
filetype plugin indent on     " required!

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set exrc
set hidden
set fileencodings=utf-8
set scrolloff=999
set history=1000         " remember more commands and search history
set undolevels=1000      
set visualbell           " don't beep
set noerrorbells         " don't beep
set nu

" tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" ^ makes tabs into spaces

" solarized
syntax on
set background=dark
set t_Co=16
colorscheme solarized
 
" remap
nnoremap <F1> :Unite buffer file_rec<cr>
nnoremap <F2> :NERDTreeToggle<cr>
nnoremap ; :
nnoremap gt :bn<cr>
nnoremap Gt :bp<cr>
 
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

" paste and keep
vnoremap p "_dP"

" change bg color for going past 80 characters
"set cc=80

" livescript autocompile
au BufWritePost *.ls silent LiveScriptMake! -d | cwindow | redraw!

" make long lines slightly indented
let &showbreak=repeat(' ', 2)

" auto reload .vimrc
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END
