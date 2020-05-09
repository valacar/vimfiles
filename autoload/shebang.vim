let s:bangs = [
      \ '#!/usr/bin/env bash',
      \ '#!/usr/bin/env python',
      \ '#!/usr/bin/env python3',
      \ '#!/usr/bin/env perl',
      \ '#!/usr/bin/env ruby',
      \ '#!/usr/bin/env sh',
      \ '#!/bin/sh',
      \ ]

function! shebang#Shebang()
  call popup_menu(s:bangs, #{callback: 'shebang#ShebangMenuHandler'})
endfunc

function! shebang#ShebangMenuHandler(id, result)
  if a:result != -1
    mark `
    0put =s:bangs[a:result - 1] . \"\n\n\"
    normal! ``
  endif
endfunc

