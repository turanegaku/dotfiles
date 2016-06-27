set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin'  : 'make -f make_cygwin.mak',
      \     'mac'     : 'make',
      \     'linux'   : 'make',
      \     'unix'    : 'gmake',
      \    },
      \ }
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
        \ 'depends' : 'Shougo/vimproc',
        \ 'autoload' : { 'insert' : 1,}
        \ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
" " }}}
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
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
" autocmd ColorScheme * hi CursorLine ctermbg=235 cterm=NONE
autocmd ColorScheme * hi LineNr ctermfg=245

set background=dark
colorscheme hybrid
syntax on
nnoremap t :<C-u>if &bg=='dark' \| set bg=light \| else \| set bg=dark \| endif<CR>

noremap <Space>h ^
noremap <Space>l $

nnoremap <Space>o  :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>

nnoremap <Space>O  :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>

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

"----------------------------------------
" uncrustify
"----------------------------------------
" see http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829

" 例: Shift-Fでコードのフォーマットを行う．
nnoremap <S-f> :call UncrustifyAuto()<CR>

" 例: 保存時に自動フォーマット
autocmd BufWritePre <buffer> :call UncrustifyAuto()

" uncrustifyの設定ファイル
let g:uncrustify_cfg_file_path = '~/.uncrustifyconfig'

" uncrustifyでフォーマットする言語
let g:uncrustify_lang = ""
autocmd FileType c let g:uncrustify_lang = "c"
autocmd FileType cpp let g:uncrustify_lang = "cpp"
autocmd FileType java let g:uncrustify_lang = "java"
autocmd FileType objc let g:uncrustify_lang = "oc"
autocmd FileType cs let g:uncrustify_lang = "cs"

" Restore cursor position, window position, and last search after running a
" command.
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

" Don't forget to add Uncrustify executable to $PATH (on Unix) or
" %PATH% (on Windows) for this command to work.
function! Uncrustify(language)
    call Preserve(':silent %!uncrustify'.' -q '.' -l '.a:language.' -c '.
                \shellescape(fnamemodify(g:uncrustify_cfg_file_path, ':p')))
endfunction

function! UncrustifyAuto()
    if g:uncrustify_lang != ""
        call Uncrustify(g:uncrustify_lang)
    endif
endfunction
