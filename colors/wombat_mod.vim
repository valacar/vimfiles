" wombat_mod.vim -- Vim color scheme.
" Author:      valacar (valacar@users.noreply.github.com)
" Webpage:     https://github.com/valacar/vimfiles/tree/master/colors
" Description: Modification of the default Wombat color scheme
" Last Change: 2020-04-30

hi clear

set background=dark

if exists('syntax_on')
  syntax reset
endif

let colors_name = 'wombat_mod'

if ($TERM =~? '256' || &t_Co >=? 256) || has('gui_running')
  hi Normal guibg=#1c1c1c guifg=#bcbcbc gui=NONE ctermbg=234 ctermfg=250 cterm=NONE
  hi NonText guibg=#111111 guifg=#777777 gui=NONE ctermbg=233 ctermfg=243 cterm=NONE
  hi Cursor guibg=#bcbcbc guifg=#000000 gui=NONE ctermbg=250 ctermfg=0 cterm=NONE
  hi CursorLine guibg=#222222 guifg=NONE gui=NONE ctermbg=235 ctermfg=NONE cterm=NONE
  hi CursorLineNr guibg=#333333 guifg=#bcbcbc gui=NONE ctermbg=237 ctermfg=250 cterm=NONE
  hi Search guibg=#999999 guifg=#000000 gui=NONE ctermbg=247 ctermfg=0 cterm=NONE
  hi SpecialKey guibg=NONE guifg=#444444 gui=NONE ctermbg=NONE ctermfg=238 cterm=NONE
  hi Folded guibg=#384048 guifg=#a0a8b0 gui=NONE ctermbg=236 ctermfg=8 cterm=NONE
  hi FoldColumn guibg=#000000 guifg=#444444 gui=NONE ctermbg=0 ctermfg=238 cterm=NONE
  hi StatusLine guibg=#4E8CD6 guifg=#ffffff gui=bold ctermbg=33 ctermfg=15 cterm=bold
  hi StatusLineNC guibg=#333333 guifg=#999999 gui=NONE ctermbg=237 ctermfg=247 cterm=NONE
  hi VertSplit guibg=#222222 guifg=#333333 gui=NONE ctermbg=235 ctermfg=237 cterm=NONE
  hi SignColumn guibg=#0c0c0c guifg=#444444 gui=NONE ctermbg=232 ctermfg=238 cterm=NONE
  hi LineNr guibg=#111111 guifg=#444444 gui=NONE ctermbg=233 ctermfg=238 cterm=NONE
  hi TabLine guibg=#5c5c5c guifg=#999999 gui=NONE ctermbg=240 ctermfg=247 cterm=NONE
  hi TabLineFill guibg=#444444 guifg=NONE gui=NONE ctermbg=238 ctermfg=NONE cterm=NONE
  hi TabLineSel guibg=#000000 guifg=#ffffff gui=NONE ctermbg=0 ctermfg=15 cterm=NONE
  hi Title guibg=NONE guifg=#dddd77 gui=bold ctermbg=NONE ctermfg=226 cterm=bold
  hi MatchParen guibg=NONE guifg=NONE gui=underline ctermbg=NONE ctermfg=NONE cterm=underline
  hi ColorColumn guibg=#990000 guifg=NONE gui=NONE ctermbg=88 ctermfg=NONE cterm=NONE
  hi WildMenu guibg=#ffff00 guifg=#000000 gui=NONE ctermbg=11 ctermfg=0 cterm=NONE
  hi IncSearch guibg=NONE guifg=NONE gui=reverse ctermbg=NONE ctermfg=NONE cterm=reverse
  hi ErrorMsg guibg=NONE guifg=#ff0000 gui=NONE ctermbg=NONE ctermfg=9 cterm=NONE
  hi WarningMsg guibg=NONE guifg=#ff9933 gui=NONE ctermbg=NONE ctermfg=208 cterm=NONE
  hi Underlined guibg=NONE guifg=#8ac6f2 gui=underline ctermbg=NONE ctermfg=111 cterm=underline
  hi Pmenu guibg=#444444 guifg=#ffffff gui=NONE ctermbg=238 ctermfg=15 cterm=NONE
  hi PmenuSel guibg=#cae682 guifg=#000000 gui=NONE ctermbg=149 ctermfg=0 cterm=NONE
  hi PmenuSbar guibg=#333333 guifg=#ff0000 gui=NONE ctermbg=237 ctermfg=9 cterm=NONE
  hi PmenuThumb guibg=#bcbcbc guifg=#ff0000 gui=NONE ctermbg=250 ctermfg=9 cterm=NONE
  hi Comment guibg=NONE guifg=#777777 gui=NONE ctermbg=NONE ctermfg=243 cterm=NONE
  hi Constant guibg=NONE guifg=#d28c83 gui=NONE ctermbg=NONE ctermfg=131 cterm=NONE
  hi Function guibg=NONE guifg=#cae682 gui=NONE ctermbg=NONE ctermfg=149 cterm=NONE
  hi Identifier guibg=NONE guifg=#cae682 gui=NONE ctermbg=NONE ctermfg=149 cterm=NONE
  hi Keyword guibg=NONE guifg=#8ac6f2 gui=NONE ctermbg=NONE ctermfg=111 cterm=NONE
  hi Number guibg=NONE guifg=#d28c83 gui=NONE ctermbg=NONE ctermfg=131 cterm=NONE
  hi PreProc guibg=NONE guifg=#d28c83 gui=NONE ctermbg=NONE ctermfg=131 cterm=NONE
  hi Special guibg=NONE guifg=#8ac6f2 gui=NONE ctermbg=NONE ctermfg=111 cterm=NONE
  hi Statement guibg=NONE guifg=#8ac6f2 gui=NONE ctermbg=NONE ctermfg=111 cterm=NONE
  hi String guibg=NONE guifg=#ffcc99 gui=NONE ctermbg=NONE ctermfg=216 cterm=NONE
  hi Todo guibg=#2d2d2d guifg=#dddd77 gui=bold ctermbg=236 ctermfg=229 cterm=bold
  hi Type guibg=NONE guifg=#cae682 gui=NONE ctermbg=NONE ctermfg=149 cterm=NONE
  hi Visual guibg=#414d5f guifg=#f0f0f0 gui=NONE ctermbg=235 ctermfg=255 cterm=NONE
  hi MoreMsg guibg=NONE guifg=#ffffff gui=NONE ctermbg=NONE ctermfg=15 cterm=NONE
  hi ModeMsg guibg=NONE guifg=#ffffff gui=NONE ctermbg=NONE ctermfg=15 cterm=NONE
  hi DiffText guibg=#669999 guifg=#ffffff gui=NONE ctermbg=73 ctermfg=15 cterm=NONE
  hi DiffChange guibg=#336666 guifg=#ffffff gui=NONE ctermbg=24 ctermfg=15 cterm=NONE
  hi DiffDelete guibg=#663333 guifg=#ffffff gui=NONE ctermbg=52 ctermfg=15 cterm=NONE
  hi DiffAdd guibg=#336633 guifg=#ffffff gui=NONE ctermbg=22 ctermfg=15 cterm=NONE
  hi CursorColumn guibg=#2d2d2d guifg=NONE gui=NONE ctermbg=236 ctermfg=NONE cterm=NONE
  hi User1 guibg=#333333 guifg=#777777 gui=NONE ctermbg=237 ctermfg=243 cterm=NONE
  hi rcMainObject guibg=NONE guifg=#ffffff gui=NONE ctermbg=NONE ctermfg=15 cterm=NONE
  hi cFormat guibg=NONE guifg=#ffcc99 gui=bold ctermbg=NONE ctermfg=216 cterm=bold
  hi cSpecial guibg=NONE guifg=#ffcc99 gui=bold ctermbg=NONE ctermfg=216 cterm=bold
  hi helpHeader guibg=NONE guifg=#ffffff gui=NONE ctermbg=NONE ctermfg=15 cterm=NONE
  hi helpHyperTextJump guibg=NONE guifg=#55D4CB gui=NONE ctermbg=NONE ctermfg=80 cterm=NONE
  hi helpHyperTextEntry guibg=NONE guifg=#B984B1 gui=NONE ctermbg=NONE ctermfg=133 cterm=NONE
  hi helpOption guibg=NONE guifg=#ffcc99 gui=NONE ctermbg=NONE ctermfg=216 cterm=NONE
  hi helpStart guibg=NONE guifg=#b984b1 gui=NONE ctermbg=NONE ctermfg=97 cterm=NONE
  hi helpExample guibg=NONE guifg=#8ac6f2 gui=NONE ctermbg=NONE ctermfg=111 cterm=NONE
  hi helpSpecial guibg=NONE guifg=#ffcc99 gui=NONE ctermbg=NONE ctermfg=216 cterm=NONE
  hi helpURL guibg=NONE guifg=#d28c83 gui=NONE ctermbg=NONE ctermfg=131 cterm=NONE
  hi helpNotVi guibg=NONE guifg=#777777 gui=NONE ctermbg=NONE ctermfg=243 cterm=NONE
  hi helpBacktick guibg=NONE guifg=#8ac6f2 gui=NONE ctermbg=NONE ctermfg=111 cterm=NONE
  hi helpCommand guibg=NONE guifg=#8ac6f2 gui=NONE ctermbg=NONE ctermfg=111 cterm=NONE
  hi diffRemoved guibg=NONE guifg=#d28c83 gui=NONE ctermbg=NONE ctermfg=131 cterm=NONE
  hi diffSubname guibg=NONE guifg=#ffcc99 gui=NONE ctermbg=NONE ctermfg=216 cterm=NONE
  hi gitcommitBranch guibg=NONE guifg=#b984b1 gui=NONE ctermbg=NONE ctermfg=97 cterm=NONE
  hi debugPC guibg=#263760 guifg=NONE gui=NONE ctermbg=25 ctermfg=NONE cterm=NONE
  hi debugBreakpoint guibg=#660000 guifg=#bcbcbc gui=NONE ctermbg=88 ctermfg=250 cterm=NONE
  hi SpellBad guibg=NONE guifg=NONE gui=undercurl guisp=#ff3300 ctermbg=NONE ctermfg=NONE cterm=undercurl
  hi SpellCap guibg=NONE guifg=NONE gui=undercurl guisp=#0099ff ctermbg=NONE ctermfg=NONE cterm=undercurl

elseif &t_Co == 8 || &t_Co == 16
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
  hi Visual ctermbg=DarkGray ctermfg=White cterm=NONE
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
  hi SpellBad ctermbg=NONE ctermfg=NONE cterm=undercurl
  hi SpellCap ctermbg=NONE ctermfg=NONE cterm=undercurl
endif

hi link TagbarSignature Comment

let g:terminal_ansi_colors = [
      \ '#000000',
      \ '#aa0000',
      \ '#00aa00',
      \ '#aa5500',
      \ '#3030FF',
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
