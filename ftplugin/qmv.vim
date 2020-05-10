" Ad-hoc file type for qmv (single column mode)
" Quick Move is from renameutils 
" https://www.nongnu.org/renameutils/

" Expecting output from:
"   qmv -f single-column -oseparate -e "vim '+setf qmv'"

if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpoptions
set cpoptions&vim

setlocal tabstop=8 softtabstop=8 shiftwidth=8 nowrap number

syntax clear
syntax match QmvOddLines "^.*$" contains=ALL nextgroup=QmvEvenLines skipnl
syntax match QmvEvenLines "^.*$" contains=ALL nextgroup=QmvOddLines skipnl

highlight QmvOddLines ctermfg=darkgray ctermbg=NONE
highlight QmvEvenLines ctermfg=gray ctermbg=NONE

" start on line 2
2

" force up/down movement to destination filename. bad idea? ;P
nnoremap <buffer> j :+3<CR>
nnoremap <buffer> k :-3<CR>
nnoremap <buffer> gg :2<CR>

let b:undo_ftplugin = 'setl tabstop< softtabstop< shiftwidth< wrap< number<'

let &cpoptions = s:cpo_save
unlet s:cpo_save
