" Enter key follows a hyperlink tag in :help
nnoremap <buffer> <CR> <c-]>

" Backspace or Mouse4 to navigate tags backwards, Mouse5 to go forward
nnoremap <buffer> <BS> :pop<CR>
nnoremap <buffer> <X1Mouse> :pop<CR>
nnoremap <buffer> <X2Mouse> :tag<CR>

" Press q to close help window
nnoremap <buffer> q <C-w>c

" Determine if we're on a syntax highlighted match called helpExample
" Note: string used by search()'s {skip} argument
function! s:isHelpExample()
  return 'synIDattr(synID(line("."), col("."), 0), "name") =~? "helpExample"'
endfunction

" TODO: make a function to dynamically create these mappings

" search for 'option'
nnoremap <buffer> <silent> o
      \ :call search("'[a-z]\\{2,\\}'", 'W', 0, 0, <SID>isHelpExample())<CR>
nnoremap <buffer> <silent> O
      \ :call search("'[a-z]\\{2,\\}'", 'Wb', 0, 0, <SID>isHelpExample())<CR>

" search for *starlink*
nnoremap <buffer> <silent> s
      \ :call search('\v\*\S{2,}\*', 'W', 0, 0, <SID>isHelpExample())<CR>
nnoremap <buffer> <silent> S
      \ :call search('\v\*\S{2,}\*', 'Wb', 0, 0, <SID>isHelpExample())<CR>

" search for |pipelink|
nnoremap <buffer> <silent> x
      \ :call search('\v\\|\S{2,}\\|', 'W', 0, 0, <SID>isHelpExample())<CR>
nnoremap <buffer> <silent> X
      \ :call search('\v\\|\S{2,}\\|', 'Wb', 0, 0, <SID>isHelpExample())<CR>

" search for 'option' or |pipelink| or *starlink*
nnoremap <buffer> <silent> <TAB>
      \ :call search('\v([\|''*])\S{2,}\1', 'W', 0, 0, <SID>isHelpExample())<CR>
nnoremap <buffer> <silent> <S-TAB>
      \ :call search('\v([\|''*])\S{2,}\1', 'Wb', 0, 0, <SID>isHelpExample())<CR>

" search for headers/divider lines
nnoremap <buffer> <silent> ]] :call search('\v^[=-]{3,}.*[=-]{3,}', 'W')<CR>
nnoremap <buffer> <silent> [[ :call search('\v^[=-]{3,}.*[=-]{3,}', 'Wb')<CR>
