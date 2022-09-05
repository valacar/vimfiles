" Vim 'after' ftplugin settings

setlocal tabstop=2          " how many columns a tab counts for
setlocal shiftwidth=2       " spaces to use for <<, >>, and auto indenting
setlocal softtabstop=2      " treat spaces like tabs when backspacing
setlocal expandtab          " convert new tabs to spaces
setlocal nowrap
setlocal formatoptions=crql " see :help fo-table
setlocal textwidth=80
setlocal fileformat=unix    " use linux line endings
setlocal keywordprg=:help   " pressing K opens current word in :help

if &spellfile !~# 'vim\.utf-8\.add'
  " add vim-related word here when typing 2zg (the 2 specifies this dictionary)
  setlocal spellfile+=~/.vim/spell/vim.utf-8.add
endif

call matchadd('Todo', '\v" \zs(TODO|Note|FIXME|IMPORTANT|BUG|XXX)\ze: ')
" Disable highlighting some stuff within vim comments
highlight link vimCommentTitle vimComment
highlight link vimCommentString vimComment

" vint linter goes to 100% usages with vim9script, so disable ALE for the buffer
if exists(':ALEDisableBuffer') && getline(1) =~# '^vim9script'
  ALEDisableBuffer
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal tabstop< shiftwidth< '
      \ . 'softtabstop< expandtab< wrap< formatoptions< '
      \ . 'fileformat< keywordprg< spellfile<'
