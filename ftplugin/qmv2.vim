" Ad-hoc file type for qmv (dual column mode)
" Quick Move is from renameutils 
" https://www.nongnu.org/renameutils/

" Expecting outfrom from:
"   qmv -f dual-column -e "vim '+setf qmv2'"

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

setlocal tabstop=8 softtabstop=8 shiftwidth=8
setlocal nowrap number cursorline

syntax clear
syntax match QmvLeftColumn '^[^\t]\+'

highlight QmvLeftColumn ctermfg=darkgray ctermbg=NONE

" move to second column when starting
normal! W

" force up/down movements to the second column (destination)
nnoremap <buffer> j j0W
nnoremap <buffer> k k0W
nnoremap <buffer> gg gg0W
nnoremap <buffer> G G0W

let b:undo_ftplugin = 'setl tabstop< softtabstop< shiftwidth< wrap< number< cursorline<'

let &cpoptions = s:cpo_save
unlet s:cpo_save
