set nocompatible

" 初期化
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc('~/.bundle-test')
filetype plugin on
filetype indent on

" plugin
NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/yanktmp.vim'
NeoBundle 'YankRing.vim'
NeoBundle 'vim-scripts/taglist.vim'
NeoBundle 'szw/vim-tags'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neomru.vim', {
  \ 'depends' : 'Shougo/unite.vim'
  \ }
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
if has('lua')
    NeoBundleLazy 'Shougo/neocomplete.vim', {
      \ 'depends' : 'Shougo/vimproc',
      \ 'autoload' : { 'insert' : 1,}
      \ }
endif
NeoBundleLazy 'Townk/vim-autoclose', {
  \ 'autoload' : { 'insert' : 1,}}
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}

NeoBundleCheck

autocmd VimEnter * execute 'source' expand('<sfile>')

let g:yanktmp_file = $HOME + '/.vim/tmp/yanktmp'
map <silent> sy :call YanktmpYank()<cr>
map <silent> sp :call YanktmpPaste_p()<cr>
map <silent> sP :call YanktmpPaste_P()<cr>

" neocomplete
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 2
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#enable_auto_select              = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
noremap <C-U><C-B> :Unite buffer<CR>
noremap <C-U><C-F> :UniteWithBufferDir -buffer-name=files file<CR>
noremap <C-U><C-R> :Unite -buffer-name=register register<CR>
noremap <C-U><C-M> :Unite file_mru<CR>
noremap <C-U><C-U> :Unite buffer file_mru<CR>
noremap <C-U><C-A> :UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

nnoremap ft :<C-u>tab stj <C-R>=expand('<cword>')<CR><CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

set mouse=a
set ttymouse=xterm2
set incsearch
set wildignore=*.o,*.obj,*.bak,*.exe
set ignorecase
set smartcase
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set smartindent
set wildmenu
set hlsearch
set backspace=indent,eol,start
set laststatus=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set tags=tags;

inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <left>
inoremap <C-l> <Right>


let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_Show_One_File = 1
let Tlist_Use_Left_Window = 1
let Tlist_Exit_OnlyWindow = 1
map <silent> <leader>l :TlistToggle<CR>

syntax on
