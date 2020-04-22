if exists('g:loaded_spellrebuild_command')
  finish
endif

let g:loaded_spellrebuild_command = 1

command! SpellRebuild for f in glob('~/vimfiles/spell/*.add', 1, 1) | exe "mkspell!" f | endfor
command! RebuildSpellFiles for f in glob('~/vimfiles/spell/*.add', 1, 1) | exe "mkspell!" f | endfor

" TODO: use mycommand#RebuildSpellFiles

" See ~/.vim/autoload/mycommand.vim
