if exists('g:loaded_dos2unix_command')
  finish
endif

let g:loaded_dos2unix_command = 1

command! Dos2Unix keepjumps call mycommand#Dos2Unix()

" See ~/.vim/autoload/mycommand.vim
