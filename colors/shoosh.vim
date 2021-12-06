set background=dark

hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'shoosh'

" comment
hi Normal       guifg=#cccccc guibg=#131313 gui=none
hi Cursor       guifg=NONE guibg=#339933 gui=none
hi CursorColumn guifg=NONE guibg=#161616 gui=none
hi CursorLine   guifg=NONE guibg=#161616 gui=none
hi Visual       guifg=#ffffff guibg=#555555 gui=none

hi Comment      guifg=#666666 guibg=NONE gui=none
hi Constant     guifg=#cccccc guibg=NONE gui=none
hi Folded       guifg=#cccccc guibg=NONE gui=none
hi Function     guifg=#cccccc guibg=NONE gui=none

hi Identifier   guifg=#ffffff guibg=NONE gui=none
hi Keyword      guifg=#ffffff guibg=NONE gui=none

hi LineNr       guifg=#cccccc guibg=NONE gui=none
hi MatchParen   guifg=#cccccc guibg=NONE gui=none
hi NonText      guifg=#cccccc guibg=NONE gui=none
hi Pmenu        guifg=#cccccc guibg=NONE gui=none
hi PmenuSel     guifg=#cccccc guibg=NONE gui=none

hi PreProc      guifg=#ffffdd guibg=NONE gui=none

hi Special      guifg=#cccccc guibg=NONE gui=none
hi SpecialKey   guifg=#cccccc guibg=NONE gui=none
hi SpecialKey   guifg=#cccccc guibg=NONE gui=none
hi Statement    guifg=#cccccc guibg=NONE gui=none
hi StatusLine   guifg=#cccccc guibg=NONE gui=none
hi StatusLineNC guifg=#cccccc guibg=NONE gui=none

hi String       guifg=#cccccc guibg=NONE gui=none
hi Number       guifg=#cccccc guibg=NONE gui=none

hi Title        guifg=#cccccc guibg=NONE gui=none
hi Todo         guifg=#cccccc guibg=NONE gui=none
hi Type         guifg=#cccccc guibg=NONE gui=none
hi VertSplit    guifg=#cccccc guibg=NONE gui=none

" RC file: change dark blue Object names
hi rcMainObject guifg=#ffffff guibg=NONE gui=NONE

" left margin (column) when viewing a diff (and folds?)
hi FoldColumn guifg=#ffffff guibg=#232323 gui=NONE

" TODO: DiffChange, DiffText, DiffAdd, DiffDelete

hi! def link cFormat String
hi! def link cSpecial String
hi! def link cRepeat Keyword
hi! def link cConditional Keyword
hi! def link cStatement Keyword

hi! def link vimTodo Comment
