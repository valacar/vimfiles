if exists('g:loaded_spellrebuild_command')
  finish
endif

let g:loaded_spellrebuild_command = 1

command! SpellRebuild call mycommand#RebuildSpellFiles()
command! RebuildSpellFiles call mycommand#RebuildSpellFiles()

" See ~/.vim/autoload/mycommand.vim
