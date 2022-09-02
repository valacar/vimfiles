" Quickfix 'after' ftplugin settings

" make sure concealed syntax is actually hidden
setlocal conceallevel=2
setlocal concealcursor+=n

" remove from buffer list, so :bn, :bp will skip it
setlocal nobuflisted

let &l:statusline = ''

" Escape or q to close quickfix or location window (when inside it)
nnoremap <silent> <buffer> <nowait> <Esc> <Cmd>cclose \| :lclose<CR>
nnoremap <silent> <buffer> q <Cmd>cclose \| :lclose<CR>
nnoremap <silent> <Space><Space> <nop>
nnoremap <silent> <S-Space><S-Space> <nop>

" filter quickfix with :Cfilter[!] /{pat}/
if !exists(':Cfilter')
  packadd cfilter
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal conceallevel< '
      \ . 'concealcursor< buflisted<'
