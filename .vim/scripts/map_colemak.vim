" move
nnoremap h h|xnoremap h h|onoremap h h|
nnoremap n j|xnoremap n j|onoremap n j|
nnoremap e k|xnoremap e k|onoremap e k|
nnoremap i l|xnoremap i l|onoremap i l|

nnoremap y o
nnoremap Y O

noremap j y
noremap J y

" prefix
nmap      <Space> [Space]
xmap      <Space> [Space]
nnoremap  [Space] <Nop>
xnoremap  [Space] <Nop>

" most powerful mapping
noremap o :
noremap O ;
inoremap ne <Esc>
onoremap ne <Esc>
nnoremap <silent><Esc><Esc> :nohlsearch<CR>

nnoremap <silent>[Space]o :<C-u>for i in range(v:count1) \| call append(line('.'), '') \| endfor<CR>
nnoremap <silent>[Space]O :<C-u>for i in range(v:count1) \| call append(line('.')-1, '') \| endfor<CR>
vnoremap <silent>[Space]s !sort<CR>

noremap gn gt
noremap gp gT
noremap gh <C-w>h
noremap gj <C-w>j
noremap gk <C-w>k
noremap gl <C-w>l
noremap gx <C-w>x

" <Nop> series
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
nnoremap q: <Nop>
nnoremap q/ <Nop>
nnoremap q? <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" move
noremap [Space]h ^
noremap [Space]l $
inoremap <C-b> <Left>
cnoremap <C-b> <Left>
inoremap <C-f> <Right>
cnoremap <C-f> <Right>
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
inoremap <C-e> <End>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

cnoremap <C-r> <C-f>
inoremap <Nul> <C-x><C-o>
