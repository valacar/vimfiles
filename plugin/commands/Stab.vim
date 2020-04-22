if exists('g:loaded_stab_command')
  finish
endif

let g:loaded_stab_command = 1

" Set all tab settings to the same value
command! -nargs=* Stab call mycommand#Stab()

" See ~/.vim/autoload/mycommand.vim
