" JSON 'after' ftplugin settings

setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal nowrap

" format progs:
" :%!python -m json.tool
" :%!jq ""

" Note: jq can be found on https://stedolan.github.io/jq/

if executable('python')
  let &l:formatprg = 'python -m json.tool'
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< shiftwidth< wrap< formatprg<'
