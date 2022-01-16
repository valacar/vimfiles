" sh 'after' ftplugin settings

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab

setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

" Popup bash help for keyword under cursor
" https://www.reddit.com/r/vim/comments/s4s3f7/some_keywordprg_snippets/
setl keywordprg=:ShellHelp
command! -buffer -narg=+ ShellHelp
      \ let b:helpout = systemlist("help " . <q-args>) |
      \ if len(b:helpout) > 1 |
      \   call popup_create(b:helpout, #{pos: 'topleft', line: 'cursor+1', col: 'cursor', moved: 'WORD', }) |
      \ endif |
      \ unlet b:helpout

let b:undo_ftplugin .= ' | setlocal tabstop< softtabstop< shiftwidth< expandtab< autoindent< smarttab< formatoptions< formatprg<'
