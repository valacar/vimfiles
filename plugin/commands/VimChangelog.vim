if exists('g:loaded_vimchangelog_command')
  finish
endif

let g:loaded_vimchangelog_command = 1

" Open Vim's changelog using curl (in a scratch buffer)
command! VimChangeLog call mycommand#VimChangelog()
command! ChangeLog call mycommand#VimChangelog()

" See ~/.vim/autoload/mycommand.vim
