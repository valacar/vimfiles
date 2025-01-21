" Format json, and show errors in location window
" Based on: https://stackoverflow.com/a/12702366
" Note: although this isn't really specific to json, it prefixes the filename
" to the error message, which I added in order to make python's json.tool
" formatter work with the quickfix window.
function! s:FormatJsonPrg(...) abort
   silent execute "'[,']!" . &formatprg
   if v:shell_error != 0
      let format_error = join(getline(line("'["), line("']")), "\n")
      silent undo
      lexpr '"' . expand('%:p') . '": ' . format_error
      lopen 5
    endif
endfunc

" gq: Format json, and shows errors in location window
nnoremap <buffer> <silent> gq :setlocal opfunc=<SID>FormatJsonPrg<cr>g@
