" awk 'after' ftplugin settings

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab

setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

if executable('gawk')
  let &l:formatprg = 'gawk -f /dev/stdin --pretty-print=/dev/stdout'
endif

let b:undo_ftplugin .= ' | setlocal tabstop< softtabstop< shiftwidth< expandtab< autoindent< smarttab< formatoptions< formatprg<'
