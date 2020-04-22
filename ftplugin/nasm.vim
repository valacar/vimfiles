if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim


setlocal tabstop=8
setlocal shiftwidth=8
setlocal noexpandtab

setlocal comments=:;
setlocal commentstring=;\ %s


let b:undo_ftplugin = "setl comments< commentstring< tabstop< shiftwidth< expandtab<"

let &cpo = s:cpo_save
unlet s:cpo_save
