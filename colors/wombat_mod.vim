" Modified Wombat color scheme
" Originally by: Lars H. Nielsen (dengmao@gmail.com)
" Modified_by: Valacar

" Note: this colorscheme is currently for true-color terminals, 16 color DOS
" console, and 8 color Linux (tty) terminal. 256 color terminals like urxvt
" might not look so good since I don't use the xterm color palette.

" TODO: duplicate cterms and add &t_Co check for 8 or 16 colors
" TODO: convert cterm's to xterm color palette numbers
" TODO: make quickfix window look better
" TODO: make tabs look better with 8 colors (maybe 16 colors too)
" TODO: finish Spell groups
" TODO: make highlight group for each color,
"         and then :call matchadd() on /#hexcolor/ to make it easier to see

" xterm color palette: https://jonasjacek.github.io/colors/

set background=dark

hi clear
if exists('syntax_on')
  syntax reset
endif

let colors_name='wombat_mod'

" Red: #d28c83 (131)
" Orange: #ffcc99 (179, 180)
" Green: #cae682 (149)
" Blue: #8ac6f2 (111)
" Light Green: #e7f6da
" Purple: #b984b1
" Yellow: #dddd77 (226)

hi Normal       guifg=#cccccc guibg=#1c1c1c gui=NONE      ctermfg=248        ctermbg=233       cterm=NONE term=NONE
hi NonText      guifg=#777777 guibg=#111111 gui=NONE      ctermfg=248        ctermbg=232       cterm=NONE term=NONE
hi Cursor       guifg=#000000 guibg=#cccccc gui=NONE
hi CursorLine   guifg=NONE    guibg=#222222 gui=NONE      ctermfg=NONE       ctermbg=NONE      cterm=NONE
hi CursorLineNr guifg=#cccccc guibg=#333333 gui=NONE      ctermfg=LightGray  ctermbg=DarkGray  cterm=NONE
hi CursorColumn guifg=NONE    guibg=#2d2d2d
hi Search       guibg=#999999 guifg=#000000 gui=NONE      ctermfg=Black      ctermbg=LightGray cterm=NONE
hi SpecialKey   guifg=#444444 guibg=NONE    gui=NONE      ctermfg=DarkGray   ctermbg=NONE
hi Folded       guifg=#a0a8b0 guibg=#384048 gui=NONE      ctermfg=LightGray  ctermbg=DarkGray
hi FoldColumn   guifg=#444444 guibg=#000000 gui=NONE      ctermfg=Black      ctermbg=DarkGray

hi StatusLine   guifg=#ffffff guibg=#4E8CD6 gui=bold      ctermfg=Black      ctermbg=Gray      cterm=NONE term=NONE
hi StatusLineNC guifg=#999999 guibg=#333333 gui=NONE      ctermfg=Gray       ctermbg=DarkGray      cterm=NONE

hi VertSplit    guifg=#333333 guibg=#222222 gui=NONE      ctermfg=Gray       ctermbg=DarkGray  cterm=NONE term=NONE
hi SignColumn   guifg=#444444 guibg=#0c0c0c gui=NONE      ctermfg=Black      ctermbg=DarkGray
hi LineNr       guifg=#444444 guibg=#111111 gui=NONE      ctermfg=LightGray  ctermbg=DarkGray  cterm=NONE

hi TabLine      guifg=#999999 guibg=#5c5c5c gui=NONE      ctermfg=DarkGray   ctermbg=Gray      cterm=NONE term=NONE
hi TabLineFill  guifg=NONE    guibg=#444444 gui=NONE      ctermfg=LightGray  ctermbg=DarkGray  cterm=bold
hi TabLineSel   guifg=#ffffff guibg=#000000 gui=NONE      ctermfg=White      ctermbg=Black
hi Title        guifg=#ffff00 guibg=NONE    gui=bold      ctermfg=Yellow     ctermbg=NONE
hi MatchParen   guifg=NONE    guibg=NONE    gui=underline ctermfg=LightGray  ctermbg=DarkGray  cterm=NONE
hi ColorColumn  guifg=NONE    guibg=#990000 gui=NONE      ctermfg=NONE       ctermbg=DarkRed   cterm=NONE
hi WildMenu     guifg=#000000 guibg=#ffff00 gui=NONE      ctermfg=Black      ctermbg=Yellow    cterm=NONE
hi IncSearch    guifg=NONE    guibg=NONE    gui=reverse   ctermfg=NONE       cterm=reverse     term=reverse
hi ErrorMsg     guifg=#ff0000 guibg=NONE    gui=NONE      ctermfg=White      ctermbg=DarkRed
hi WarningMsg   guifg=#ff9933 guibg=NONE    gui=NONE   ctermfg=White      ctermbg=Brown
hi Underlined   guifg=#8ac6f2 guibg=NONE    gui=underline cterm=underline    term=underline
hi Pmenu        guifg=#f6f3e8 guibg=#444444 gui=NONE      ctermfg=White      ctermbg=DarkGray
hi PmenuSel     guifg=#000000 guibg=#cae682 gui=NONE      ctermfg=White      ctermbg=DarkGreen
hi PmenuSbar    guifg=#ff0000 guibg=#333333 gui=NONE      ctermfg=NONE       ctermbg=DarkGray
hi PmenuThumb   guifg=#ff0000 guibg=#cccccc gui=NONE      ctermfg=NONE       ctermbg=LightGray
hi Comment      guifg=#777777 guibg=NONE    gui=NONE      ctermfg=DarkGray   ctermbg=NONE cterm=bold term=NONE
hi Constant     guifg=#d28c83 guibg=NONE    gui=NONE      ctermfg=LightRed
hi Function     guifg=#cae682 guibg=NONE    gui=NONE      ctermfg=LightGreen
hi Identifier   guifg=#cae682 guibg=NONE    gui=NONE      ctermfg=LightGreen
hi Keyword      guifg=#8ac6f2 guibg=NONE    gui=NONE      ctermfg=LightBlue
hi Number       guifg=#d28c83 guibg=NONE    gui=NONE      ctermfg=LightRed
hi PreProc      guifg=#d28c83 guibg=NONE    gui=NONE      ctermfg=LightRed
hi Special      guifg=#8ac6f2 guibg=NONE    gui=NONE      ctermfg=LightBlue
hi Statement    guifg=#8ac6f2 guibg=NONE    gui=NONE      ctermfg=LightBlue
hi String       guifg=#ffcc99 guibg=NONE    gui=NONE      ctermfg=Yellow
hi Todo         guifg=#dddd77 guibg=#2c2c2c gui=bold      ctermfg=Yellow     ctermbg=Black
hi Type         guifg=#cae682 guibg=NONE    gui=NONE      ctermfg=LightGreen
hi Visual       guifg=#f0f0f0 guibg=#414d5f gui=NONE      ctermfg=LightCyan  ctermbg=DarkBlue  cterm=NONE
hi MoreMsg      guifg=#ffffff guibg=NONE    gui=NONE      ctermfg=White      ctermbg=Black     cterm=NONE
hi ModeMsg      guifg=#ffffff guibg=NONE    gui=NONE      ctermfg=White      ctermbg=Black     cterm=NONE
hi DiffText     guifg=#ffffff guibg=#669999 gui=NONE      ctermfg=Black      ctermbg=Yellow    cterm=NONE
hi DiffChange   guifg=#ffffff guibg=#336666 gui=NONE      ctermfg=White      ctermbg=DarkBlue  cterm=NONE
hi DiffDelete   guifg=#ffffff guibg=#663333 gui=NONE      ctermfg=White      ctermbg=DarkRed   cterm=NONE
hi DiffAdd      guifg=#ffffff guibg=#336633 gui=NONE      ctermfg=White      ctermbg=DarkGreen cterm=NONE

" Middle of the status line
hi User1 guifg=#777777 guibg=#333333

" Note: See :help cterm-colors for list of color names

" RC file: change dark blue Object names
hi rcMainObject guifg=#ffffff guibg=NONE gui=NONE

" C file
hi cFormat     guifg=#ffcc99 guibg=NONE    gui=bold ctermfg=Yellow ctermbg=NONE
hi cSpecial    guifg=#ffcc99 guibg=NONE    gui=bold ctermfg=Yellow ctermbg=NONE

" Help file
hi helpHeader         guifg=#f0f0f0
hi helpHyperTextJump  guifg=#55D4CB
hi helpHyperTextEntry guifg=#b984b1
hi helpOption         guifg=#ffcc99
hi helpStart          guifg=#dba1ee

" Diff file: actually for git commit -v
hi diffRemoved guifg=#d28c83
hi diffSubname guifg=#ffcc99
hi gitcommitBranch guifg=#b984b1

" Note: SpellCap is a word that should start with capital letter
"       SpellLocal is a word used in another region (foreign?)
"       SpellRare is a word hardly ever used
hi SpellBad ctermfg=15 ctermbg=1 cterm=underline
hi SpellCap ctermfg=15 ctermbg=4 cterm=underline
" hi SpellCap
" hi SpellRare
" hi SpellLocal

" ----

" this shouldn't be here, but it's the insert mode cursor color that I set in
" my vimrc file
" hi iCursor guibg=#ff0000

" ---- Various plugin highlights ----

hi! link TagbarSignature Comment

