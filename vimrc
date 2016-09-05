"----------------------------------------------------------------------
" Bundle Management: Vundle
"----------------------------------------------------------------------

set nocompatible
call plug#begin('~/.vim/plugged')

" plugins 
Plug 'altercation/vim-colors-solarized'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'zefei/buftabs'
Plug 'tpope/vim-unimpaired'
Plug 'danro/rename.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'Raimondi/delimitMate'
Plug 'kana/vim-arpeggio'

" language support
"Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'gkz/vim-ls'
Plug 'othree/html5.vim'
Plug 'plasticboy/vim-markdown'
Plug 'wavded/vim-stylus'
Plug 'posva/vim-vue'

" javascript
Plug 'jelera/vim-javascript-syntax'
Plug 'gavocanov/vim-js-indent'

" Add plugins to &runtimepath
call plug#end()

"----------------------------------------------------------------------
" Color Scheme
"----------------------------------------------------------------------

syntax enable
set background=dark
colorscheme solarized
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
set backspace=indent,eol,start  " fix backspace

let &showbreak=repeat(' ', 2)   " make long lines slightly indented

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

"set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to (speed boost)
set ttyfast
set showmatch           " highlight matching [{()}]

"----------------------------------------------------------------------
" Settings: Searching
"----------------------------------------------------------------------

set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nmap <silent> ,/ :nohlsearch<CR>    " clear highlighted text

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
" Settings: Bindings!
"----------------------------------------------------------------------

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

"----------------------------------------------------------------------
" Settings: plasticboy/vim-markdown
"----------------------------------------------------------------------

let g:vim_markdown_folding_disabled=1
let g:vim_markdown_no_default_key_mappings = 1

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

" validate json files
au BufRead,BufNewFile *.json set filetype=json

"----------------------------------------------------------------------
" Settings: search visually
"----------------------------------------------------------------------

vnoremap // y/<C-R>"<CR>

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

"----------------------------------------------------------------------
" Settings: vim-go 
"----------------------------------------------------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"----------------------------------------------------------------------
" Settings: arpeggio
"----------------------------------------------------------------------

call arpeggio#map('i', '', 0, 'jk', '<Esc>')

"----------------------------------------------------------------------
" Settings: buffers
"----------------------------------------------------------------------

let g:buftabline_numbers = 1 


"----------------------------------------------------------------------
" Settings: nerdtree
"----------------------------------------------------------------------

map <C-n> :NERDTreeToggle<CR>
