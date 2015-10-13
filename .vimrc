set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'unix' : 'make -f make_unix.mak',
      \ },
      \ }
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
NeoBundle 'tyru/caw.vim.git'
map <C-k> <Plug>(caw:i:toggle)
call neobundle#end()


filetype plugin indent on

set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<,eol:<
set incsearch
set hlsearch
set nowrap
set showmatch
set nowrapscan
set ignorecase
set smartcase
set hidden
set history=2000
set noswapfile
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set helplang=en
set laststatus=2
set t_Co=256
set cursorline
autocmd ColorScheme * hi CursorLine ctermbg=234 cterm=NONE

set background=dark
colorscheme elflord
syntax on

noremap <Space>h ^
noremap <Space>l $

nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

nnoremap <Esc><Esc> :nohlsearch<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
noremap ; :
noremap : ;

inoremap jk <Esc>
inoremap <silent> <C-d> <C-g>u<C-h>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
