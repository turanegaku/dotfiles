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
  echo 'unexecutable:' . a:prefix
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

augroup vimrc
  autocmd!
  autocmd FileType vim set keywordprg=:help
augroup END


syntax on

" alias
noremap <Space>h ^
noremap <Space>l $

nnoremap <silent><Space>o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent><Space>O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

noremap gn gt
noremap gp gT
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
