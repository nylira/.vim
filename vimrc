"----------------------------------------------------------------------
" Bundle Management: Vundle
"----------------------------------------------------------------------

set nocompatible
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" plugins 
Plugin 'altercation/vim-colors-solarized'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'zefei/buftabs'
Plugin 'tpope/vim-unimpaired'
Plugin 'danro/rename.vim'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Raimondi/delimitMate'

" language support
Plugin 'digitaltoad/vim-jade'
Plugin 'elzr/vim-json'
Plugin 'fatih/vim-go'
Plugin 'gkz/vim-ls'
Plugin 'othree/html5.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'wavded/vim-stylus'
Plugin 'posva/vim-vue'

" javascript
Plugin 'jelera/vim-javascript-syntax'
Plugin 'gavocanov/vim-js-indent'

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

" clipboard
set clipboard=unnamed

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
"set relativenumber      " show relative numbers in insert
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
map gT :bn<cr>

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

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"----------------------------------------------------------------------
" Settings: undotree
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
" Settings: Syntastic
"----------------------------------------------------------------------

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers=['jsonlint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_html_checkers=['']
let g:syntastic_html_tidy_ignore_errors = [
    \ 'proprietary attribute "v-'
    \ , 'trimming empty'
    \ , '<base> escaping malformed URI reference'
    \ , '<link> escaping malformed URI reference'
    \ , 'proprietary attribute "required'
    \ , 'proprietary attribute "novalidate'
    \ , 'proprietary attribute "analytics'
    \ , 'proprietary attribute "placeholder'
    \ , 'proprietary attribute "hidden'
    \ , 'missing <li>'
    \ ]

" make json files get validated
au BufRead,BufNewFile *.json set filetype=json

"----------------------------------------------------------------------
" Settings: whitespace
"----------------------------------------------------------------------

autocmd BufWritePre *.js :%s/\s\+$//e


"----------------------------------------------------------------------
" Settings: youcompleteme
"----------------------------------------------------------------------
"
"let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

"----------------------------------------------------------------------
" Settings: search visually
"----------------------------------------------------------------------

vnoremap // y/<C-R>"<CR>


"----------------------------------------------------------------------
" Settings: search visually
"----------------------------------------------------------------------
let g:vim_markdown_no_default_key_mappings = 1

"----------------------------------------------------------------------
" Settings: neocomplete 
"----------------------------------------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

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
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

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
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
