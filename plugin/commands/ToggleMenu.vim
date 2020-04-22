if exists('g:loaded_togglemenu_command')
  finish
endif

let g:loaded_togglemenu_command = 1

" Toggle GUI menu
command! ToggleMenu call mycommand#ToggleMenu()

" See ~/.vim/autoload/mycommand.vim
