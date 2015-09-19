filetype indent on

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
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set helplang=en

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

inoremap jk <Esc>
inoremap <silent> <C-d> <C-g>u<C-h>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

inoremap { {}<Left>
inoremap [ []<Left>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ` ``<Left>
