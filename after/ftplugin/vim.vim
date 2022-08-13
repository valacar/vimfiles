" Vim 'after' ftplugin settings

setlocal tabstop=2              " how many columns a tab counts for
setlocal shiftwidth=2           " spaces to use for <<, >>, and auto indenting
setlocal softtabstop=2          " treat spaces like tabs when backspacing
setlocal expandtab              " convert new tabs to spaces

setlocal nowrap

setlocal formatoptions-=c       " don't auto-wrap comments and insert comment leader
setlocal formatoptions-=o       " don't insert comment leader when pressing o or O
setlocal formatoptions-=r       " don't insert comment leader when pressing <Enter>

setlocal fileformat=unix        " use linux line endings

if &spellfile !~# 'vim\.utf-8\.add'
  setlocal spellfile+=~/.vim/spell/vim.utf-8.add   " add vim-related word here when typing 2zg (the 2 specifies this dictionary)
endif

call matchadd('Todo', '\v" \zs(TODO|Note|FIXME|IMPORTANT|BUG|XXX)\ze: ')
" Disable highlighting some stuff within vim comments
highlight link vimCommentTitle vimComment
highlight link vimCommentString vimComment

" vint linter goes to 100% usages with vim9script, so I'll just disable ALE for the buffer
if exists(':ALEDisableBuffer') && getline(1) =~# '^vim9script'
  ALEDisableBuffer
endif

" allow vim to undo our settings when/if the file type changes
let b:undo_ftplugin = b:undo_ftplugin . ' | setlocal wrap< formatoptions< spellfile< fileformat<'
