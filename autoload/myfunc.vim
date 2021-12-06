function! myfunc#ReloadConfig(filename) abort
  execute 'source' a:filename
  execute 'source' '~/.vim/after/ftplugin/vim.vim'
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
