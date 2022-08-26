" JSON 'after' ftplugin settings

setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal nowrap

" format progs:
" :%!python -m json.tool
" :%!jq ""

" Note: jq can be found on https://stedolan.github.io/jq/

if executable('python')
  let &l:formatprg = 'python -m json.tool'
endif

" Note: not sure how to ignore things, so the char number is the error number
let &errorformat = '\"%f\": %m: line %l column %c (char %n)'

" gq: Format json, and shows errors in location window
nnoremap <buffer> gq :setlocal opfunc=myfunc#FormatJsonPrg<cr>g@

" ALE likes to clear my location window even though I'm not using ALE for json
if exists(':ALEDisableBuffer')
  ALEDisableBuffer
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< softtabstop< '
      \ . 'shiftwidth< wrap< expandtab< formatprg< errorformat<'
