" wombat_mod.vim -- Vim color scheme.
" Author:      valacar (valacar@users.noreply.github.com)
" Webpage:     https://github.com/valacar/vimfiles/tree/master/colors
" Description: Modification of the default Wombat color scheme
" Last Change: 2021-11-24

hi clear

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'wombat_mod'

if ($TERM =~? '256' || &t_Co >= 256) || has('gui_running')
    hi Normal ctermbg=234 ctermfg=250 cterm=NONE guibg=#1c1c1c guifg=#bcbcbc gui=NONE
    hi NonText ctermbg=233 ctermfg=243 cterm=NONE guibg=#111111 guifg=#777777 gui=NONE
    hi Cursor ctermbg=250 ctermfg=0 cterm=NONE guibg=#bcbcbc guifg=#000000 gui=NONE
    hi CursorLine ctermbg=235 ctermfg=NONE cterm=NONE guibg=#222222 guifg=NONE gui=NONE
    hi CursorLineNr ctermbg=237 ctermfg=250 cterm=NONE guibg=#333333 guifg=#bcbcbc gui=NONE
    hi Search ctermbg=247 ctermfg=0 cterm=NONE guibg=#999999 guifg=#000000 gui=NONE
    hi SpecialKey ctermbg=NONE ctermfg=238 cterm=NONE guibg=NONE guifg=#444444 gui=NONE
    hi Folded ctermbg=236 ctermfg=8 cterm=NONE guibg=#384048 guifg=#a0a8b0 gui=NONE
    hi FoldColumn ctermbg=0 ctermfg=238 cterm=NONE guibg=#000000 guifg=#444444 gui=NONE
    hi StatusLine ctermbg=33 ctermfg=15 cterm=bold guibg=#4E8CD6 guifg=#ffffff gui=bold
    hi StatusLineNC ctermbg=237 ctermfg=247 cterm=NONE guibg=#333333 guifg=#999999 gui=NONE
    hi VertSplit ctermbg=235 ctermfg=237 cterm=NONE guibg=#222222 guifg=#333333 gui=NONE
    hi SignColumn ctermbg=232 ctermfg=238 cterm=NONE guibg=#0c0c0c guifg=#444444 gui=NONE
    hi LineNr ctermbg=233 ctermfg=238 cterm=NONE guibg=#111111 guifg=#444444 gui=NONE
    hi TabLine ctermbg=240 ctermfg=247 cterm=NONE guibg=#5c5c5c guifg=#999999 gui=NONE
    hi TabLineFill ctermbg=238 ctermfg=NONE cterm=NONE guibg=#444444 guifg=NONE gui=NONE
    hi TabLineSel ctermbg=0 ctermfg=15 cterm=NONE guibg=#000000 guifg=#ffffff gui=NONE
    hi Title ctermbg=NONE ctermfg=226 cterm=bold guibg=NONE guifg=#dddd77 gui=bold
    hi MatchParen ctermbg=NONE ctermfg=NONE cterm=underline guibg=NONE guifg=NONE gui=underline
    hi ColorColumn ctermbg=88 ctermfg=NONE cterm=NONE guibg=#990000 guifg=NONE gui=NONE
    hi WildMenu ctermbg=11 ctermfg=0 cterm=NONE guibg=#ffff00 guifg=#000000 gui=NONE
    hi IncSearch ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi ErrorMsg ctermbg=NONE ctermfg=9 cterm=NONE guibg=NONE guifg=#ff0000 gui=NONE
    hi WarningMsg ctermbg=NONE ctermfg=208 cterm=NONE guibg=NONE guifg=#ff9933 gui=NONE
    hi Underlined ctermbg=NONE ctermfg=111 cterm=underline guibg=NONE guifg=#8ac6f2 gui=underline
    hi Pmenu ctermbg=238 ctermfg=15 cterm=NONE guibg=#444444 guifg=#ffffff gui=NONE
    hi PmenuSel ctermbg=149 ctermfg=0 cterm=NONE guibg=#cae682 guifg=#000000 gui=NONE
    hi PmenuSbar ctermbg=237 ctermfg=9 cterm=NONE guibg=#333333 guifg=#ff0000 gui=NONE
    hi PmenuThumb ctermbg=250 ctermfg=9 cterm=NONE guibg=#bcbcbc guifg=#ff0000 gui=NONE
    hi Comment ctermbg=NONE ctermfg=243 cterm=NONE guibg=NONE guifg=#777777 gui=NONE
    hi Constant ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#d28c83 gui=NONE
    hi Function ctermbg=NONE ctermfg=149 cterm=NONE guibg=NONE guifg=#cae682 gui=NONE
    hi Identifier ctermbg=NONE ctermfg=149 cterm=NONE guibg=NONE guifg=#cae682 gui=NONE
    hi Keyword ctermbg=NONE ctermfg=111 cterm=NONE guibg=NONE guifg=#8ac6f2 gui=NONE
    hi Number ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#d28c83 gui=NONE
    hi PreProc ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#d28c83 gui=NONE
    hi Special ctermbg=NONE ctermfg=111 cterm=NONE guibg=NONE guifg=#8ac6f2 gui=NONE
    hi Statement ctermbg=NONE ctermfg=111 cterm=NONE guibg=NONE guifg=#8ac6f2 gui=NONE
    hi String ctermbg=NONE ctermfg=216 cterm=NONE guibg=NONE guifg=#ffcc99 gui=NONE
    hi Todo ctermbg=236 ctermfg=229 cterm=bold guibg=#2d2d2d guifg=#dddd77 gui=bold
    hi Type ctermbg=NONE ctermfg=149 cterm=NONE guibg=NONE guifg=#cae682 gui=NONE
    hi Visual ctermbg=NONE ctermfg=NONE cterm=reverse guibg=NONE guifg=NONE gui=reverse
    hi MoreMsg ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi ModeMsg ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi DiffText ctermbg=73 ctermfg=15 cterm=NONE guibg=#669999 guifg=#ffffff gui=NONE
    hi DiffChange ctermbg=24 ctermfg=15 cterm=NONE guibg=#336666 guifg=#ffffff gui=NONE
    hi DiffDelete ctermbg=52 ctermfg=15 cterm=NONE guibg=#663333 guifg=#ffffff gui=NONE
    hi DiffAdd ctermbg=22 ctermfg=15 cterm=NONE guibg=#336633 guifg=#ffffff gui=NONE
    hi CursorColumn ctermbg=236 ctermfg=NONE cterm=NONE guibg=#2d2d2d guifg=NONE gui=NONE
    hi User1 ctermbg=237 ctermfg=243 cterm=NONE guibg=#333333 guifg=#777777 gui=NONE
    hi rcMainObject ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi cFormat ctermbg=NONE ctermfg=216 cterm=bold guibg=NONE guifg=#ffcc99 gui=bold
    hi cSpecial ctermbg=NONE ctermfg=216 cterm=bold guibg=NONE guifg=#ffcc99 gui=bold
    hi helpHeader ctermbg=NONE ctermfg=15 cterm=NONE guibg=NONE guifg=#ffffff gui=NONE
    hi helpHyperTextJump ctermbg=NONE ctermfg=80 cterm=NONE guibg=NONE guifg=#55D4CB gui=NONE
    hi helpHyperTextEntry ctermbg=NONE ctermfg=133 cterm=NONE guibg=NONE guifg=#B984B1 gui=NONE
    hi helpOption ctermbg=NONE ctermfg=216 cterm=NONE guibg=NONE guifg=#ffcc99 gui=NONE
    hi helpStart ctermbg=NONE ctermfg=97 cterm=NONE guibg=NONE guifg=#b984b1 gui=NONE
    hi helpExample ctermbg=NONE ctermfg=111 cterm=NONE guibg=NONE guifg=#8ac6f2 gui=NONE
    hi helpSpecial ctermbg=NONE ctermfg=216 cterm=NONE guibg=NONE guifg=#ffcc99 gui=NONE
    hi helpURL ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#d28c83 gui=NONE
    hi helpNotVi ctermbg=NONE ctermfg=243 cterm=NONE guibg=NONE guifg=#777777 gui=NONE
    hi helpBacktick ctermbg=NONE ctermfg=111 cterm=NONE guibg=NONE guifg=#8ac6f2 gui=NONE
    hi helpCommand ctermbg=NONE ctermfg=111 cterm=NONE guibg=NONE guifg=#8ac6f2 gui=NONE
    hi diffRemoved ctermbg=NONE ctermfg=131 cterm=NONE guibg=NONE guifg=#d28c83 gui=NONE
    hi diffSubname ctermbg=NONE ctermfg=216 cterm=NONE guibg=NONE guifg=#ffcc99 gui=NONE
    hi gitcommitBranch ctermbg=NONE ctermfg=97 cterm=NONE guibg=NONE guifg=#b984b1 gui=NONE
    hi debugPC ctermbg=25 ctermfg=NONE cterm=NONE guibg=#263760 guifg=NONE gui=NONE
    hi debugBreakpoint ctermbg=88 ctermfg=250 cterm=NONE guibg=#660000 guifg=#bcbcbc gui=NONE
    hi SpellBad ctermbg=124 ctermfg=15 cterm=undercurl guibg=#ff3300 guifg=#ffffff gui=undercurl guisp=#ff3300
    hi SpellCap ctermbg=33 ctermfg=15 cterm=undercurl guibg=#0099ff guifg=#ffffff gui=undercurl guisp=#0099ff

elseif &t_Co == 8 || $TERM !~# '^linux' || &t_Co == 16
    set t_Co=16

    hi Normal ctermbg=Black ctermfg=Gray cterm=NONE
    hi NonText ctermbg=Black ctermfg=DarkGray cterm=NONE
    hi Cursor ctermbg=Gray ctermfg=Black cterm=NONE
    hi CursorLine ctermbg=DarkGray ctermfg=NONE cterm=NONE
    hi CursorLineNr ctermbg=DarkGray ctermfg=Gray cterm=NONE
    hi Search ctermbg=Gray ctermfg=Black cterm=NONE
    hi SpecialKey ctermbg=NONE ctermfg=DarkGray cterm=NONE
    hi Folded ctermbg=DarkGray ctermfg=Gray cterm=NONE
    hi FoldColumn ctermbg=Black ctermfg=DarkGray cterm=NONE
    hi StatusLine ctermbg=DarkBlue ctermfg=White cterm=bold
    hi StatusLineNC ctermbg=DarkGray ctermfg=Gray cterm=NONE
    hi VertSplit ctermbg=DarkGray ctermfg=DarkGray cterm=NONE
    hi SignColumn ctermbg=Black ctermfg=DarkGray cterm=NONE
    hi LineNr ctermbg=Black ctermfg=DarkGray cterm=NONE
    hi TabLine ctermbg=DarkGray ctermfg=Gray cterm=NONE
    hi TabLineFill ctermbg=DarkGray ctermfg=NONE cterm=NONE
    hi TabLineSel ctermbg=Black ctermfg=White cterm=NONE
    hi Title ctermbg=NONE ctermfg=Yellow cterm=bold
    hi MatchParen ctermbg=NONE ctermfg=NONE cterm=underline
    hi ColorColumn ctermbg=DarkRed ctermfg=NONE cterm=NONE
    hi WildMenu ctermbg=Yellow ctermfg=Black cterm=NONE
    hi IncSearch ctermbg=NONE ctermfg=NONE cterm=reverse
    hi ErrorMsg ctermbg=NONE ctermfg=LightRed cterm=NONE
    hi WarningMsg ctermbg=NONE ctermfg=Brown cterm=NONE
    hi Underlined ctermbg=NONE ctermfg=LightBlue cterm=underline
    hi Pmenu ctermbg=DarkGray ctermfg=White cterm=NONE
    hi PmenuSel ctermbg=LightGreen ctermfg=Black cterm=NONE
    hi PmenuSbar ctermbg=DarkGray ctermfg=LightRed cterm=NONE
    hi PmenuThumb ctermbg=Gray ctermfg=LightRed cterm=NONE
    hi Comment ctermbg=NONE ctermfg=DarkGray cterm=NONE
    hi Constant ctermbg=NONE ctermfg=LightRed cterm=NONE
    hi Function ctermbg=NONE ctermfg=LightGreen cterm=NONE
    hi Identifier ctermbg=NONE ctermfg=LightGreen cterm=NONE
    hi Keyword ctermbg=NONE ctermfg=LightBlue cterm=NONE
    hi Number ctermbg=NONE ctermfg=LightRed cterm=NONE
    hi PreProc ctermbg=NONE ctermfg=LightRed cterm=NONE
    hi Special ctermbg=NONE ctermfg=LightBlue cterm=NONE
    hi Statement ctermbg=NONE ctermfg=LightBlue cterm=NONE
    hi String ctermbg=NONE ctermfg=Brown cterm=NONE
    hi Todo ctermbg=DarkGray ctermfg=Yellow cterm=bold
    hi Type ctermbg=NONE ctermfg=LightGreen cterm=NONE
    hi Visual ctermbg=NONE ctermfg=NONE cterm=reverse
    hi MoreMsg ctermbg=NONE ctermfg=White cterm=NONE
    hi ModeMsg ctermbg=NONE ctermfg=White cterm=NONE
    hi DiffText ctermbg=DarkCyan ctermfg=White cterm=NONE
    hi DiffChange ctermbg=Gray ctermfg=White cterm=NONE
    hi DiffDelete ctermbg=DarkRed ctermfg=White cterm=NONE
    hi DiffAdd ctermbg=DarkGreen ctermfg=White cterm=NONE
    hi CursorColumn ctermbg=DarkGray ctermfg=NONE cterm=NONE
    hi User1 ctermbg=DarkGray ctermfg=DarkGray cterm=NONE
    hi rcMainObject ctermbg=NONE ctermfg=White cterm=NONE
    hi cFormat ctermbg=NONE ctermfg=Brown cterm=bold
    hi cSpecial ctermbg=NONE ctermfg=Brown cterm=bold
    hi helpHeader ctermbg=NONE ctermfg=White cterm=NONE
    hi helpHyperTextJump ctermbg=NONE ctermfg=LightCyan cterm=NONE
    hi helpHyperTextEntry ctermbg=NONE ctermfg=LightMagenta cterm=NONE
    hi helpOption ctermbg=NONE ctermfg=Brown cterm=NONE
    hi helpStart ctermbg=NONE ctermfg=LightMagenta cterm=NONE
    hi helpExample ctermbg=NONE ctermfg=LightBlue cterm=NONE
    hi helpSpecial ctermbg=NONE ctermfg=Brown cterm=NONE
    hi helpURL ctermbg=NONE ctermfg=LightRed cterm=NONE
    hi helpNotVi ctermbg=NONE ctermfg=DarkGray cterm=NONE
    hi helpBacktick ctermbg=NONE ctermfg=LightBlue cterm=NONE
    hi helpCommand ctermbg=NONE ctermfg=LightBlue cterm=NONE
    hi diffRemoved ctermbg=NONE ctermfg=LightRed cterm=NONE
    hi diffSubname ctermbg=NONE ctermfg=Brown cterm=NONE
    hi gitcommitBranch ctermbg=NONE ctermfg=LightMagenta cterm=NONE
    hi debugPC ctermbg=DarkBlue ctermfg=NONE cterm=NONE
    hi debugBreakpoint ctermbg=DarkRed ctermfg=Gray cterm=NONE
    hi SpellBad ctermbg=DarkRed ctermfg=White cterm=undercurl
    hi SpellCap ctermbg=DarkBlue ctermfg=White cterm=undercurl
endif

hi link TagbarSignature Comment

let g:terminal_ansi_colors = [
  \ '#000000',
  \ '#aa0000',
  \ '#00aa00',
  \ '#aa5500',
  \ '#5c5cff',
  \ '#aa00aa',
  \ '#00aaaa',
  \ '#b5b5b5',
  \ '#555555',
  \ '#ff5555',
  \ '#7EF27E',
  \ '#ffff55',
  \ '#7575F0',
  \ '#ff55ff',
  \ '#55ffff',
  \ '#ffffff',
  \ ]

" Generated with RNB (https://github.com/romainl/vim-rnb)
