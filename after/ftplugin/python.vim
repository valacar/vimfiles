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

nnoremap <buffer> <silent> <LocalLeader>r :update<bar>make<bar>bot cwindow<CR>

compiler python

let b:ale_python_flake8_options = '--max-line-length=88'

let b:undo_ftplugin .= ' | setlocal tabstop< softtabstop< shiftwidth< expandtab< autoindent< smarttab< formatoptions< formatprg< makeprg< errorformat<'
