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
set backspace=indent,start

set helplang=en,ja

" set clipboard+=autoselect
set visualbell t_vb=

set wildmenu
set wildmode=longest:full,full

set encoding=utf-8
set fileencodings=ascii,iso-2022-jp,euc-jp,utf-8,sjis

augroup vimrc
  autocmd!
  autocmd FileType vim set keywordprg=:help
augroup END
