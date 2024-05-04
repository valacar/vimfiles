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

if exists(':Sh') " vim-shout
  function! s:RunPython()
    exec 'Sh python' expand('%:p')
    call win_gotoid(b:shout_initial_winid)
  endfunction
  nnoremap <buffer> <F9> <Cmd>update<bar>call <SID>RunPython()<CR>
  inoremap <buffer> <F9> <Cmd>update<bar>call <SID>RunPython()<CR><Esc>
else
  nnoremap <buffer> <silent> <F9> <cmd>update<bar>make<CR>
endif

compiler python

let b:undo_ftplugin .= ' | setlocal tabstop< softtabstop< shiftwidth< '
      \ . 'expandtab< autoindent< smarttab< textwidth< formatoptions< '
      \ . 'formatprg< makeprg< errorformat<'
