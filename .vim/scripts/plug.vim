let g:plug = {
      \ "plug":   expand("~/.vim/autoload/plug.vim"),
      \ "base":   expand("~/.vim/plugged"),
      \ "url":    "https://raw.github.com/junegunn/vim-plug/master/plug.vim",
      \ "github": "https://github.com/junegunn/vim-plug",
      \ }

function! g:plug.ready()
  return filereadable(self.plug)
endfunction

""" plug
if g:plug.ready()
  call plug#begin(g:plug.base)
  Plug 'Shougo/vimproc.vim', {'do': 'make'}

  "" visibler
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'itchyny/lightline.vim'

  "" colorscheme
  Plug 'w0ng/vim-hybrid'
  Plug 'altercation/vim-colors-solarized'

  Plug 'tyru/caw.vim', {'on': '<Plug>(caw:hatpos:toggle)'}
  Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
  Plug 'thinca/vim-quickrun', {'on': 'QuickRun'}

  Plug 'tpope/vim-endwise', {'for': 'ruby'}

  Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'
  if has('lua')
    Plug 'Shougo/neocomplete.vim'
  endif
  " augroup load_plug_InsertEnter
  "   autocmd!
  "   autocmd InsertEnter * call plug#load('neocomplete', 'neosinippet')
  "         \| autocmd! load_plug_InsertEnter
  " augroup END

  "" lang
  Plug 'cespare/vim-toml', {'for': 'toml'}
  Plug 'digitaltoad/vim-pug', {'for': 'pug'}
  Plug 'keith/tmux.vim', {'for': 'tmux'}
  " Plug 'isRuslan/vim-es6', {'for': 'javascript'}
  Plug 'pangloss/vim-javascript', {'for': 'javascript'}
  Plug 'othree/html5.vim', {'for': 'html'}

  "" lint
  Plug 'osyo-manga/shabadou.vim', {'for': 'python'}
  Plug 'jceb/vim-hier', {'for': 'python'}
  Plug 'osyo-manga/vim-watchdogs', {'for': ['c', 'cpp', 'javascript', 'python', 'ruby']}

  "" completion
  if has('python') || has('python3')
    Plug 'davidhalter/jedi-vim', {'for': 'python'}
  endif

  Plug 'aharisu/vim_goshrepl'

  call plug#end()
endif


"" vim-trailing-whitespace
let g:extra_whitespace_ignored_filetypes = ["unite", "help"]

"" lightline
let g:lightline = {'colorscheme': 'Tomorrow'}

if $ITERM_PROFILE != 'Light'
  let g:lightline['colorscheme'] = 'Tomorrow_Night'
endif

"" colorscheme
if !exists("$ITERM_PROFILE") || $ITERM_PROFILE != 'Light'
  colorscheme hybrid
  set background=dark

  augroup scheme
    autocmd!
    autocmd ColorScheme hybrid hi CursorLine ctermbg=236
    autocmd ColorScheme hybrid hi LineNr ctermfg=245
  augroup END
else
  colorscheme solarized
endif

"" caw.vim
map <C-k> <Plug>(caw:hatpos:toggle)

"" vim-over
nnoremap <silent> ,/ :OverCommandLine<CR>%s/
vnoremap <silent> ,/ :OverCommandLine<CR>s/

"" quickrun
nnoremap <silent>,i :QuickRun -mode n<CR>
vnoremap <silent>,i :QuickRun -mode v<CR>

"" neosnippet
let g:neosnippet#snippets_directory='~/.vim/rc/snippets/'
imap <expr><CR> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)" : "\<CR>"

imap <expr><TAB> pumvisible() ? "<C-n>" : neosnippet#expandable_or_jumpable() ? "<Plug>(neosnippet_expand_or_jump)" : "<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

"" neocomplete
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"" jedi-vim
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
" let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#rename_command = "<leader>R"
autocmd FileType python setlocal completeopt-=preview
