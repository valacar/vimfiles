setlocal spell

if &spellfile !~# 'rst\.utf-8\.add'
  setlocal spellfile+=~/vimfiles/spell/rst.utf-8.add   " add rst-related word here when typing 2zg (the 2 specifies this dictionary)
endif

if exists('b:undo_ftplugin')
  let b:undo_ftplugin = b:undo_ftplugin . '| setlocal spell< spellfile<'
else
  let b:undo_ftplugin = 'setlocal spell< spellfile<'
endif
