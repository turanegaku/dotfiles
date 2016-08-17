set nocompatible
filetype off

if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('itchyny/lightline.vim')
call dein#add('tyru/caw.vim')
call dein#add('w0ng/vim-hybrid')
call dein#end()

let g:lightline = {
      \ 'colorscheme': 'solarized'
      \ }
map <C-k> <Plug>(caw:hatpos:toggle)

" if has('lua')
"   NeoBundleLazy 'Shougo/neocomplete.vim', {
"         \ 'depends' : 'Shougo/vimproc',
"         \ 'autoload' : { 'insert' : 1,}
"         \ }
" endif
"
" " neocomplete {{{
" let g:neocomplete#enable_at_startup               = 1
" let g:neocomplete#auto_completion_start_length    = 3
" let g:neocomplete#enable_ignore_case              = 1
" let g:neocomplete#enable_smart_case               = 1
" let g:neocomplete#enable_camel_case               = 1
" let g:neocomplete#use_vimproc                     = 1
" let g:neocomplete#sources#buffer#cache_limit_size = 1000000
" let g:neocomplete#sources#tags#cache_limit_size   = 30000000
" let g:neocomplete#enable_fuzzy_completion         = 1
" let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" " " }}}
" " NeoBundle 'Townk/vim-autoclose'
" call neobundle#end()


filetype plugin indent on

set number
set ruler
set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
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
set clipboard+=autoselect
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,sjis
autocmd ColorScheme * hi CursorLine ctermbg=236
autocmd ColorScheme * hi LineNr ctermfg=245

set background=dark
colorscheme hybrid
syntax on
nnoremap t :<C-u>if &bg=='dark' \| set bg=light \| else \| set bg=dark \| endif<CR>

noremap <Space>h ^
noremap <Space>l $

nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

noremap gc :tabnew<Space>
noremap gn gt
noremap gp gT
noremap g\| :vsp<Space>
noremap g- :sp<Space>
noremap gh <C-w>h
noremap gj <C-w>j
noremap gk <C-w>k
noremap gl <C-w>l

nnoremap <Esc><Esc> :nohlsearch<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap q <Nop>
noremap ; :
noremap : ;

inoremap jk <Esc>
inoremap <C-b> <Left>
inoremap <C-f> <Right>

vnoremap s !sort<CR>

cnoremap <C-r> <C-f>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
