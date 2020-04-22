" dwarffortress 'after' ftplugin settings

setlocal wrap
setlocal linebreak

" toggle between YES and NO
nnoremap <buffer> <silent> <LocalLeader>t
      \ :s/\<\(YES\\|NO\)\>/\=submatch(0)==#'YES'?'NO':'YES'/e<CR>

let b:undo_ftplugin = 'setlocal wrap< linebreak<'
