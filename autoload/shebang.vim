let s:bangs = [
      \ '#!/usr/bin/env bash',
      \ '#!/usr/bin/env python',
      \ '#!/usr/bin/env python3',
      \ '#!/usr/bin/env perl',
      \ '#!/usr/bin/env ruby',
      \ '#!/usr/bin/env sh',
      \ '#!/bin/sh',
      \ ]

" append menu item to edit this script at the end
call add(s:bangs, 'Add another shebang')

let s:script_path = resolve(expand('<sfile>:p'))

function! shebang#Shebang()
  call popup_menu(s:bangs, #{callback: 'shebang#ShebangMenuHandler'})
endfunc

function! shebang#ShebangMenuHandler(id, result)
  if a:result == -1
    return
  elseif a:result == len(s:bangs)
    execute 'edit' s:script_path
  else
    mark `
    0put =s:bangs[a:result - 1] . \"\n\n\"
    normal! ``
  endif
endfunc

