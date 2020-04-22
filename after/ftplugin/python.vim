" Python 'after' ftplugin settings

setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

if executable('black')
  if has('win32')
    let &l:formatprg = 'black --quiet --line-length 88 - 2>nul'
  else
    let &l:formatprg = 'black --quiet --line-length 88 - 2>/dev/null'
  endif
endif

" nnoremap <buffer> <silent> <LocalLeader>r :update<CR>:!start cmd /c python "%" & pause<CR>
nnoremap <buffer> <silent> <LocalLeader>r :update<CR>:!python "%"<CR>

" Note: the stock python ftplugin doesn't have this b:undo_ftplugin var for some reason,
" so I guess we need to check if it exists, in case that changes.
let s:undo = 'setlocal tabstop< softtabstop< shiftwidth< expandtab< autoindent< smarttab< formatoptions< formatprg<'
if exists('b:undo_ftplugin')
  let b:undo_ftplugin = b:undo_ftplugin . '| ' . s:undo
else
  let b:undo_ftplugin = s:undo
endif
