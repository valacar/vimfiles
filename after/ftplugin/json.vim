setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
setlocal expandtab
setlocal nowrap

" format progs:
" :%!python -m json.tool
" :%!jq ""

" Note: jq can be found on https://stedolan.github.io/jq/

if executable('python')
  let &l:formatprg = 'python -m json.tool'
  let &l:formatprg .= ' --indent ' . &l:tabstop
endif

" gq mapping in ~/.vim/after/ftplugin/json/format-json.vim

" Note: not sure how to ignore things, so the char number is the error number
let &errorformat = '\"%f\": %m: line %l column %c (char %n)'

" ALE likes to clear my location window even though I'm not using ALE for json
if exists(':ALEDisableBuffer')
  ALEDisableBuffer
endif


" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< '
      \ . 'shiftwidth< wrap< expandtab< formatprg< errorformat<'
