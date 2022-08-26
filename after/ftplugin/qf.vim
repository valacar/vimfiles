" Quickfix 'after' ftplugin settings

" make sure concealed syntax is actually hidden
setlocal conceallevel=2
setlocal concealcursor+=n

let &l:statusline = ''

" Escape or q (or Q) to close quickfix or location window (when inside it)
nnoremap <silent> <buffer> <nowait> <Esc> <Cmd>cclose \| :lclose<CR>
nnoremap <silent> <buffer> q <Cmd>cclose \| :lclose<CR>
nnoremap <silent> <buffer> Q
      \ :try <bar> cclose <bar> catch /E444/ <bar> quit! <bar> endtry<CR>

" filter quickfix with :Cfilter[!] /{pat}/
if !exists(':Cfilter')
  " runtime! pack/dist/opt/cfilter/plugin/cfilter.vim
  packadd cfilter
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal conceallevel< concealcursor<'
