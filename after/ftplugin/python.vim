" Python 'after' ftplugin settings

setlocal tabstop=8
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal textwidth=88
setlocal formatoptions=crql

if executable('ruff')
  let &l:formatprg = 'ruff format --silent -'
endif

nnoremap <buffer> <silent> <F9> <cmd>update<bar>make<CR>

compiler python

let b:undo_ftplugin .= ' | setlocal tabstop< softtabstop< shiftwidth< '
      \ . 'expandtab< autoindent< smarttab< textwidth< formatoptions< '
      \ . 'formatprg< makeprg< errorformat<'
