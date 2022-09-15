function! myfunc#ReloadConfig(filename) abort
  execute 'source' a:filename
  execute 'source' '~/.vim/after/ftplugin/vim.vim'
  doautocmd ColorScheme 
endfunction

" Show syntax highlighting groups for what's under the cursor
function! myfunc#SynStack() abort
  let col = col('.')
  let line = line('.')
  let syntaxID = synID(line, col, 0)
  let syntaxID_trans = synID(line, col, 1)
  echo synIDattr(syntaxID_trans, 'name') .
     \ ', translated: ' . synIDattr(syntaxID, 'name') .
     \ ', link: ' . synIDattr(synIDtrans(syntaxID_trans), 'name') .
     \ ', FG: ' . synIDattr(synIDtrans(syntaxID_trans), 'fg#') .
     \ ', BG: ' . synIDattr(synIDtrans(syntaxID_trans), 'bg#')
endfunc

" Format json, and show errors in location window
" Based on: https://stackoverflow.com/a/12702366
" Note: although this isn't really specific to json, it prefixes the filename
" to the error message, which I added in order to make python's json.tool
" formatter work with the quickfix window.
function! myfunc#FormatJsonPrg(...) abort
   silent execute "'[,']!" . &formatprg
   if v:shell_error != 0
      let format_error = join(getline(line("'["), line("']")), "\n")
      silent undo
      lexpr '"' . expand('%:p') . '": ' . format_error
      lopen 5
    endif
endfunc
