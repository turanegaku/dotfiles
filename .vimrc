if 0 | endif

if exists('$SUDO_USER')
  finish
endif

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

function! s:glob(from, pattern)
  return split(globpath(a:from, a:pattern), "[\r\n]")
endfunction

function! s:load(pattern) abort
  let base = expand($HOME.'/.vim/scripts')
  let found = v:false

  for file in s:glob(base, a:pattern)
    execute 'source' escape(file, ' ')
    let found = v:true
  endfor

  return found
endfunction

" let s:is_colemak = system('/Applications/Karabiner.app/Contents/Library/bin/karabiner list')
" let s:is_colemak = system('/Applications/Karabiner.app/Contents/Library/bin/karabiner selected')

call s:load('plug.vim')
" call s:load('dein.vim')

call s:load('map.vim')
call s:load('option.vim')

filetype plugin indent on
syntax enable on

set secure
