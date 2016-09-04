filetype off

if &compatible
  set nocompatible
endif

"" version
function! s:get_executable(prefix, suffix_array)
  for a:suffix in a:suffix_array
    let a:command = a:prefix . a:suffix
    if executable(a:command)
      return a:command
    endif
  endfor
  throw 'unexecutable'
endfunction
let s:clang_suffix_array = ['', '-3.8', '-3.4']
let g:clang_exec         = s:get_executable('clang', s:clang_suffix_array)
let g:clang_plus_exec    = s:get_executable('clang++', s:clang_suffix_array)
let g:clang_format_exec  = s:get_executable('clang-format', s:clang_suffix_array)


"" dein
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" auto install
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" load plugin
if dein#load_state(s:dein_dir)
  call dein#begin(expand(s:dein_dir))

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/deinlazy.toml'

  call dein#load_toml(s:toml,       {'lazy': 0})
  call dein#load_toml(s:lazy_toml,  {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

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

" config
" set number
" set ruler
set cursorline

set laststatus=2
set t_Co=256

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
set showmatch

set nowrap
set nowrapscan

set incsearch
set hlsearch
set ignorecase
set smartcase

set hidden
set history=2000
set noswapfile

set autoindent
set expandtab
set tabstop=2
set shiftwidth=2

set helplang=en,ja

set clipboard+=autoselect
set visualbell t_vb=

set wildmenu
set wildmode=longest:full,full

set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,utf-8,sjis

syntax on

" alias
noremap <Space>h ^
noremap <Space>l $

nnoremap <silent><Space>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Space>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

" noremap gc :tabnew<Space>
noremap gn gt
noremap gp gT
" noremap g\| :vsp<Space>
" noremap g- :sp<Space>
noremap gh <C-w>h
noremap gj <C-w>j
noremap gk <C-w>k
noremap gl <C-w>l
noremap gx <C-w>x

nnoremap <silent><Esc><Esc> :nohlsearch<CR>

nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap q <Nop>
noremap ; :
noremap : ;

inoremap jk <Esc>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <Nul> <C-x><C-o>

vnoremap s !sort<CR>

cnoremap <C-r> <C-f>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
