" map
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
