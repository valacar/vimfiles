" Enter key searches :help for word under cursor
nnoremap <buffer> <CR> <C-]>

" Enter or MiddleMouse button searches for visually selected text in :help
xnoremap <buffer> <CR> <C-]>
xnoremap <buffer> <MiddleMouse> <C-]>

" Backspace or Mouse4 to navigate backwards, Mouse5 to go forward
nnoremap <buffer> <BS> <C-t>
nnoremap <buffer> <X1Mouse> <C-t>
nnoremap <buffer> <X2Mouse> <C-]>

" q to close help window
nnoremap <buffer> q <C-w>c

function! s:SkipGroup()
  let grp = synIDattr(synID(line('.'), col('.'), 0), 'name')
  " skip anything that's not one of these highlight-groups
  return grp != 'helpStar'
    \ && grp != 'helpBar'
    \ && grp != 'helpBacktick'
    \ && grp != 'helpOption'
    \ && grp != 'helpSpecial'
endfunction

" Tab/Shift-Tab to jump to pretty much anything highlighted
nnoremap <buffer> <Tab>   <Cmd>call search('\([*<bar>''`]\).\{-}\1\<bar>{.\{-}}\<bar><lt>.\{-}>\<bar>\[.\{-}\]\<bar>CTRL-.', 'W',  0, 0, function('<SID>SkipGroup'))<CR>
nnoremap <buffer> <S-Tab> <Cmd>call search('\([*<bar>''`]\).\{-}\1\<bar>{.\{-}}\<bar><lt>.\{-}>\<bar>\[.\{-}\]\<bar>CTRL-.', 'Wb', 0, 0, function('<SID>SkipGroup'))<CR>
