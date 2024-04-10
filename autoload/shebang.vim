let s:bangs = [
      \ '#!/usr/bin/env bash',
      \ '#!/usr/bin/env python3',
      \ '#!/usr/bin/env perl',
      \ '#!/usr/bin/env ruby',
      \ '#!/usr/bin/env sh',
      \ ]

" append menu item to edit this script at the end
call add(s:bangs, 'Add another shebang')

let s:script_path = resolve(expand('<sfile>:p'))

function! shebang#Shebang()
  call s:move_to_top(&filetype)
  call popup_menu(s:bangs, #{callback: 'shebang#ShebangMenuHandler'})
endfunc

" move current filetype to top of list
function! s:move_to_top(ft)
  if &filetype == a:ft
    let m = match(s:bangs, '\<' .. a:ft .. '.*$')
    if m != -1
      call insert(s:bangs, remove(s:bangs, m))
    endif
  endif
endfunc

function! shebang#ShebangMenuHandler(id, result)
  if a:result == -1  " user hit Esc or x
    return
  elseif a:result == len(s:bangs)
    " edit this script if last item selected
    execute 'edit' s:script_path
  else
    mark `
    0put =s:bangs[a:result - 1] . \"\n\n\"
    normal! ``
  endif
endfunc

