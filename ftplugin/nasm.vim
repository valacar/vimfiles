if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim


setlocal tabstop=8
setlocal shiftwidth=8
setlocal noexpandtab

setlocal comments=:;
setlocal commentstring=;\ %s


let b:undo_ftplugin = 'setlocal comments< commentstring< tabstop< shiftwidth< expandtab<'

let &cpoptions = s:cpo_save
unlet s:cpo_save
