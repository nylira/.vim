"----------------------------------------------------------------------
" Bundle Management: Vundle
"----------------------------------------------------------------------

filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" plugins 
Bundle 'altercation/vim-colors-solarized'
Bundle 'kana/vim-arpeggio'
Bundle 'kien/ctrlp.vim'
Bundle 'mbbill/undotree'
Bundle 'Raimondi/delimitMate'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Shougo/neocomplete.vim'
Bundle 'zefei/buftabs'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-surround'

" syntax highlighting and support
Bundle 'digitaltoad/vim-jade'
Bundle 'elzr/vim-json'
Bundle 'gkz/vim-ls'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'plasticboy/vim-markdown'
Bundle 'wavded/vim-stylus'

" haskell
Bundle 'lukerandall/haskellmode-vim'
Bundle 'eagletmt/neco-ghc'

filetype plugin indent on     " required!

 "----------------------------------------------------------------------
" Color Scheme: Solarized
"----------------------------------------------------------------------

syntax on
colorscheme solarized

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
set autochdir                   " set directory based on open file

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

map gt :bp<cr>
map gT :bn<cr>

"----------------------------------------------------------------------
" Settings: File Types
"----------------------------------------------------------------------

" Makefile - tab instead of space"
autocmd FileType make setlocal noexpandtab

" livescript autocompile
au BufWritePost *.ls silent LiveScriptMake! -d | cwindow | redraw!

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
"let delimitMate_expand_inside_quotes = 1
let delimitMate_jump_expansion = 1
let delimitMate_smart_quotes = 1
"let delimitMate_balance_matchpairs = 1

au FileType c,javascript,typescript let b:delimitMate_eol_marker = ";"

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
let g:ctrlp_custom_ignore = '\vbuild/|dist/|venv/|\.(o|swp|pyc|egg)$'

"----------------------------------------------------------------------
" Settings: udotree
"----------------------------------------------------------------------

nnoremap <F5> :UndotreeToggle<cr>

if has("persistent_undo")
  set undofile
  set undodir=$HOME/.vim/undo
  set undolevels=1024         " How many undos
  set undoreload=32768        " number of lines to save for undo
endif

"----------------------------------------------------------------------
" Settings: Shougo/neocomplete
"----------------------------------------------------------------------

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
"inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
"endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
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
