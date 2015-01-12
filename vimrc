"----------------------------------------------------------------------
" Bundle Management: Vundle
"----------------------------------------------------------------------

set nocompatible
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/Vundle.vim'

" plugins 
Plugin 'altercation/vim-colors-solarized'
Plugin 'kana/vim-arpeggio'
Plugin 'kien/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'Raimondi/delimitMate'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'zefei/buftabs'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-surround'

" language support
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'gkz/vim-ls'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'wavded/vim-stylus'

" javascript
Plugin 'marijnh/tern_for_vim'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'moll/vim-node'


" haskell
Plugin 'dag/vim2hs'
"Plugin 'lukerandall/haskellmode-vim'
Plugin 'eagletmt/neco-ghc'

call vundle#end()
filetype plugin indent on     " required!

 "----------------------------------------------------------------------
" Color Scheme: Solarized
"----------------------------------------------------------------------

syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=16

set guifont=Consolas:h14

"----------------------------------------------------------------------
" Settings: General
"----------------------------------------------------------------------

set exrc
set hidden                      " switch buffers w/o saving
set fileencodings=utf-8
set scrolloff=999
set history=1000                " remember more 
set undolevels=1000             " undo all the things
set visualbell                  " don't beep
set noerrorbells                " don't beep
"set autochdir                   " set directory based on open file

set backspace=indent,eol,start  " fix backspace

let &showbreak=repeat(' ', 2)   " make long lines slightly indented

" auto reload .vimrc
augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

"----------------------------------------------------------------------
" Settings: Spaces & Tabs
"----------------------------------------------------------------------

set tabstop=2            " number of visual spaces per tab
set softtabstop=2        " number of spaces in tab when editing
set shiftwidth=2
set expandtab            " tabs are spaces

"----------------------------------------------------------------------
" Settings: UI Config
"----------------------------------------------------------------------

set number              " show line numbers
set relativenumber      " show relative numbers in insert
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to (speed boost)
set showmatch           " highlight matching [{()}]

"----------------------------------------------------------------------
" Settings: Searching
"----------------------------------------------------------------------

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nmap <silent> ,/ :nohlsearch<CR>    " clear highlighted text

"----------------------------------------------------------------------
" Settings: Folding
"----------------------------------------------------------------------

"set foldenable          " enable folding
"set foldlevelstart=10   " open most folds by default
"set foldnestmax=10      " 10 nested fold max
"nnoremap <space> za     " space key open & closes folds
"set foldmethod=indent   " fold based on indent level

"----------------------------------------------------------------------
" Settings: Bindings
"----------------------------------------------------------------------

nnoremap ; :

call arpeggio#map('i', '', 0, 'jk', '<Esc>')

set pastetoggle=<F3>

" edit splits easier
map <C-\> :vsplit<cr>
map <C-_> :split<cr>

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"----------------------------------------------------------------------
" Settings: Buffers
"----------------------------------------------------------------------

map gt :bn<cr>
"map gT :bn<cr>

"----------------------------------------------------------------------
" Settings: File Types
"----------------------------------------------------------------------

" Makefile - tab instead of space"
autocmd FileType make setlocal noexpandtab

" livescript autocompile
"let livescript_make_options = '--bare'
"au BufWritePost *.ls silent LiveScriptMake! -d | cwindow | redraw!

"----------------------------------------------------------------------
" Settings: Backup
"----------------------------------------------------------------------

set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

"----------------------------------------------------------------------
" Settings: delimitMate
"----------------------------------------------------------------------

let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 1
let delimitMate_smart_quotes = 1
let delimitMate_balance_matchpairs = 1

"au FileType c,cs,javascript,typescript let b:delimitMate_eol_marker = ';'

"----------------------------------------------------------------------
" Settings: NERDTree
"----------------------------------------------------------------------

nnoremap <F2> :NERDTreeToggle<CR>

" open the old buffer instead a new one
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif   

"----------------------------------------------------------------------
" Settings: CtrlP (ctrlp)
"----------------------------------------------------------------------

let g:ctrlp_map = '<F1>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = '\v[\/](\.(git|hg|svn)|node_modules)$'

"----------------------------------------------------------------------
" Settings: udotree
"----------------------------------------------------------------------

nnoremap <F4> :UndotreeToggle<cr>

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
  set undolevels=1024         " How many undos
  set undoreload=32768        " number of lines to save for undo
endif

"----------------------------------------------------------------------
" Settings: Bindings!
"----------------------------------------------------------------------

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

"----------------------------------------------------------------------
" Settings: Haskell
"----------------------------------------------------------------------
let g:haddock_browser = '<F6>'

"----------------------------------------------------------------------
" Settings: plasticboy/vim-markdown
"----------------------------------------------------------------------

let g:vim_markdown_folding_disabled=1

"----------------------------------------------------------------------
" Settings: C++
"----------------------------------------------------------------------
autocmd filetype cpp nnoremap <F5> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR> '

 "----------------------------------------------------------------------
" Settings: Syntastic
"----------------------------------------------------------------------

let g:syntastic_javascript_checkers = ['jshint']

