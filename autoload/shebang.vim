let s:bangs = [
      \ '#!/usr/bin/env bash',
      \ '#!/usr/bin/env python3',
      \ '#!/usr/bin/env perl',
      \ '#!/usr/bin/env ruby',
      \ '#!/usr/bin/env sh',
      \ ]

" corresponding filetypes (needs to match s:bangs)
let s:filetypes = [
      \ 'bash',
      \ 'python',
      \ 'perl',
      \ 'ruby',
      \ 'sh'
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
    let index = a:result - 1
    0put =s:bangs[index] . \"\n\n\"
    normal! ``
    if index < len(s:bangs) " ignore last item that edits the script
      exec 'setf' s:filetypes[index]
    endif
  endif
endfunc

