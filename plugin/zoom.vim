" Adjust font size quickly using mapping or command.
" Note that that window size will also change.
" Adapted from https://vim.fandom.com/wiki/Change_font_size_quickly

if exists('g:loaded_zoom')
    finish
endif
let g:loaded_zoom = 1

" GVim only
if ! has('gui_running')
  finish
endif

command! -narg=0 ZoomIn  call <SID>AdjustFontSize(1)
command! -narg=0 ZoomOut call <SID>AdjustFontSize(-1)

" Same mapping as web browsers, Ctrl-= and Ctrl--
nnoremap <unique> <C-=> <Cmd>ZoomIn<CR>
nnoremap <unique> <C-_> <Cmd>ZoomOut<CR>

let s:minfontsize = 8
let s:maxfontsize = 24

function! s:AdjustFontSize(amount)
  let pattern = '^\(.* \)\([1-9][0-9]*\)$'
  let fontname = substitute(&guifont, pattern, '\1', '')
  let cursize = substitute(&guifont, pattern, '\2', '')
  let newsize = cursize + a:amount
  if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
    let newfont = fontname . newsize
    let &guifont = newfont
  endif
endfunction
