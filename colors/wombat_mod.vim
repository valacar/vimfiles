" Name:         Wombat Mod
" Description:  A modification of the Wombat theme by Lars H. Nielsen
" Author:       Valacar <valacar@users.noreply.github.com>
" Maintainer:   Valacar <valacar@users.noreply.github.com>
" Website:      https://github.com/valacar/vimfiles/tree/master/colors
" License:      Vim License (see `:help license`)
" Last Updated: Thu 08 Sep 2022 02:01:48 PM PDT

" Generated by Colortemplate v2.2.0

set background=dark

hi clear
let g:colors_name = 'wombat_mod'

let s:t_Co = exists('&t_Co') && !has('gui_running') ? (&t_Co ?? 0) : -1
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running')

hi! link Boolean Constant
hi! link Character Constant
hi! link Conditional Statement
hi! link Debug Special
hi! link Define PreProc
hi! link Delimiter Special
hi! link Exception Statement
hi! link Float Constant
hi! link Include PreProc
hi! link Label Statement
hi! link Macro PreProc
hi! link Number Constant
hi! link Operator Statement
hi! link PopupSelected PmenuSel
hi! link PreCondit PreProc
hi! link QuickFixLine Search
hi! link Repeat Statement
hi! link SpecialChar Special
hi! link SpecialComment Special
hi! link StorageClass Type
hi! link Structure Type
hi! link Tag Special
hi! link Typedef Type
hi! link lCursor Cursor
hi! link EndOfBuffer NonText
hi! link CurSearch Search

if (has('termguicolors') && &termguicolors) || has('gui_running')
  let g:terminal_ansi_colors = ['#000000', '#aa0000', '#00aa00', '#aa5500', '#5c5cff', '#aa00aa', '#00aaaa', '#b5b5b5', '#555555', '#ff5555', '#7ef27e', '#ffff55', '#7575f0', '#ff55ff', '#55ffff', '#ffffff']
endif
if get(g:, 'wombatmod_transp_bg', 0) && !has('gui_running')
  hi Normal guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
  hi NonText guifg=#777777 guibg=NONE gui=NONE cterm=NONE
  hi LineNr guifg=#5c5c5c guibg=NONE gui=NONE cterm=NONE
  hi SignColumn guifg=#444444 guibg=NONE gui=NONE cterm=NONE
  hi Terminal guifg=#bcbcbc guibg=NONE gui=NONE cterm=NONE
else
  hi Normal guifg=#bcbcbc guibg=#1c1c1c gui=NONE cterm=NONE
  hi NonText guifg=#777777 guibg=#111111 gui=NONE cterm=NONE
  hi LineNr guifg=#5c5c5c guibg=#111111 gui=NONE cterm=NONE
  hi SignColumn guifg=#444444 guibg=#0c0c0c gui=NONE cterm=NONE
  hi Terminal guifg=#bcbcbc guibg=#1c1c1c gui=NONE cterm=NONE
endif
hi Terminal guifg=#bcbcbc guibg=#1c1c1c gui=NONE cterm=NONE
hi ColorColumn guifg=fg guibg=#990000 gui=NONE cterm=NONE
hi Comment guifg=#777777 guibg=NONE gui=NONE cterm=NONE
hi Conceal guifg=NONE guibg=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi Constant guifg=#d28c83 guibg=NONE gui=NONE cterm=NONE
hi Cursor guifg=#000000 guibg=#bcbcbc gui=NONE cterm=NONE
hi CursorColumn guifg=NONE guibg=#2d2d2d gui=NONE cterm=NONE
hi CursorLine guifg=NONE guibg=#222222 gui=NONE cterm=NONE
hi CursorLineSign guifg=NONE guibg=#222222 gui=NONE cterm=NONE
hi CursorLineFold guifg=NONE guibg=#222222 gui=NONE cterm=NONE
hi CursorLineNr guifg=#bcbcbc guibg=#333333 gui=NONE cterm=NONE
hi DiffAdd guifg=#ffffff guibg=#336633 gui=NONE cterm=NONE
hi DiffChange guifg=#ffffff guibg=#336666 gui=NONE cterm=NONE
hi DiffDelete guifg=#ffffff guibg=#663333 gui=NONE cterm=NONE
hi DiffText guifg=#ffffff guibg=#669999 gui=NONE cterm=NONE
hi Directory guifg=#55d4cb guibg=NONE gui=NONE cterm=NONE
hi Error guifg=#ffffff guibg=#ff0000 gui=NONE cterm=NONE
hi ErrorMsg guifg=#ff0000 guibg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#444444 guibg=#000000 gui=NONE cterm=NONE
hi Folded guifg=#a0a8b0 guibg=#384048 gui=NONE cterm=NONE
hi Function guifg=#cae682 guibg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#cae682 guibg=NONE gui=NONE cterm=NONE
hi Ignore guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi Keyword guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi LineNrAbove guifg=#444444 guibg=#111111 gui=NONE cterm=NONE
hi LineNrBelow guifg=#444444 guibg=#111111 gui=NONE cterm=NONE
hi MatchParen guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=reverse
hi ModeMsg guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi Number guifg=#d28c83 guibg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#ffffff guibg=#444444 gui=NONE cterm=NONE
hi PmenuSbar guifg=#ff0000 guibg=#333333 gui=NONE cterm=NONE
hi PmenuSel guifg=#000000 guibg=#cae682 gui=NONE cterm=NONE
hi PmenuThumb guifg=#ff0000 guibg=#bcbcbc gui=NONE cterm=NONE
hi PreProc guifg=#d28c83 guibg=NONE gui=NONE cterm=NONE
hi Question guifg=#00ff00 guibg=NONE gui=bold cterm=bold
hi Search guifg=#000000 guibg=#999999 gui=NONE cterm=NONE
hi Special guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#444444 guibg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#ffffff guibg=#660000 guisp=#ff0000 gui=undercurl cterm=underline
hi SpellCap guifg=#ffffff guibg=#004d80 guisp=#56bcff gui=undercurl cterm=underline
hi SpellLocal guifg=#ffffff guibg=#006666 guisp=#00ffff gui=undercurl cterm=underline
hi SpellRare guifg=#ffffff guibg=#660066 guisp=#ff00ff gui=undercurl cterm=underline
hi Statement guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#ffffff guibg=#4e8cd6 gui=bold cterm=bold
hi StatusLineNC guifg=#999999 guibg=#333333 gui=NONE cterm=NONE
hi StatusLineTerm guifg=#000000 guibg=#cae682 gui=bold cterm=bold
hi StatusLineTermNC guifg=#000000 guibg=#cae682 gui=NONE cterm=NONE
hi String guifg=#ffcc99 guibg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#999999 guibg=#5c5c5c gui=NONE cterm=NONE
hi TabLineFill guifg=NONE guibg=#444444 gui=NONE cterm=NONE
hi TabLineSel guifg=#ffffff guibg=#000000 gui=NONE cterm=NONE
hi Title guifg=#dddd77 guibg=NONE gui=bold cterm=bold
hi Todo guifg=#dddd77 guibg=#2d2d2d gui=NONE cterm=NONE
hi Type guifg=#cae682 guibg=NONE gui=NONE cterm=NONE
hi Underlined guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi User1 guifg=#777777 guibg=#333333 gui=NONE cterm=NONE
hi VertSplit guifg=#333333 guibg=#222222 gui=NONE cterm=NONE
hi Visual guifg=NONE guibg=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
hi VisualNOS guifg=NONE guibg=NONE gui=underline ctermfg=NONE ctermbg=NONE cterm=underline
hi WarningMsg guifg=#ff9933 guibg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#000000 guibg=#ffff00 gui=NONE cterm=NONE
hi cFormat guifg=#ffcc99 guibg=NONE gui=bold cterm=bold
hi cSpecial guifg=#ffcc99 guibg=NONE gui=bold cterm=bold
hi debugBreakpoint guifg=#bcbcbc guibg=#660000 gui=NONE cterm=NONE
hi debugPC guifg=NONE guibg=#263760 gui=NONE cterm=NONE
hi diffRemoved guifg=#d28c83 guibg=NONE gui=NONE cterm=NONE
hi diffSubname guifg=#ffcc99 guibg=NONE gui=NONE cterm=NONE
hi gitcommitBranch guifg=#b984b1 guibg=NONE gui=NONE cterm=NONE
hi helpBacktick guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi helpCommand guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi helpExample guifg=#8ac6f2 guibg=NONE gui=NONE cterm=NONE
hi helpHeader guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi helpHyperTextEntry guifg=#b984b1 guibg=NONE gui=NONE cterm=NONE
hi helpHyperTextJump guifg=#55d4cb guibg=NONE gui=NONE cterm=NONE
hi helpNotVi guifg=#777777 guibg=NONE gui=NONE cterm=NONE
hi helpOption guifg=#ffcc99 guibg=NONE gui=NONE cterm=NONE
hi helpSpecial guifg=#ffcc99 guibg=NONE gui=NONE cterm=NONE
hi helpStart guifg=#b984b1 guibg=NONE gui=NONE cterm=NONE
hi helpURL guifg=#d28c83 guibg=NONE gui=NONE cterm=NONE
hi rcMainObject guifg=#ffffff guibg=NONE gui=NONE cterm=NONE
hi CursorIM guifg=NONE guibg=fg gui=NONE cterm=NONE
hi ToolbarLine guifg=NONE guibg=#777777 gui=NONE cterm=underline
hi ToolbarButton guifg=#000000 guibg=#bcbcbc gui=bold cterm=bold

if s:t_Co >= 256
  if get(g:, 'wombatmod_transp_bg', 0)
    hi Normal ctermfg=250 ctermbg=NONE cterm=NONE
    hi NonText ctermfg=243 ctermbg=NONE cterm=NONE
    hi LineNr ctermfg=59 ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=238 ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=250 ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=250 ctermbg=234 cterm=NONE
    hi NonText ctermfg=243 ctermbg=233 cterm=NONE
    hi LineNr ctermfg=59 ctermbg=233 cterm=NONE
    hi SignColumn ctermfg=238 ctermbg=232 cterm=NONE
    hi Terminal ctermfg=250 ctermbg=234 cterm=NONE
  endif
  hi Terminal ctermfg=250 ctermbg=234 cterm=NONE
  hi ColorColumn ctermfg=fg ctermbg=88 cterm=NONE
  hi Comment ctermfg=243 ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Constant ctermfg=174 ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=16 ctermbg=250 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorLineSign ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorLineFold ctermfg=NONE ctermbg=235 cterm=NONE
  hi CursorLineNr ctermfg=250 ctermbg=236 cterm=NONE
  hi DiffAdd ctermfg=231 ctermbg=22 cterm=NONE
  hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE
  hi DiffDelete ctermfg=231 ctermbg=52 cterm=NONE
  hi DiffText ctermfg=231 ctermbg=66 cterm=NONE
  hi Directory ctermfg=80 ctermbg=NONE cterm=NONE
  hi Error ctermfg=231 ctermbg=196 cterm=NONE
  hi ErrorMsg ctermfg=196 ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=238 ctermbg=16 cterm=NONE
  hi Folded ctermfg=248 ctermbg=238 cterm=NONE
  hi Function ctermfg=192 ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=192 ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=231 ctermbg=NONE cterm=NONE
  hi IncSearch ctermfg=NONE ctermbg=NONE cterm=reverse
  hi Keyword ctermfg=111 ctermbg=NONE cterm=NONE
  hi LineNrAbove ctermfg=238 ctermbg=233 cterm=NONE
  hi LineNrBelow ctermfg=238 ctermbg=233 cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ModeMsg ctermfg=231 ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=231 ctermbg=NONE cterm=NONE
  hi Number ctermfg=174 ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=231 ctermbg=238 cterm=NONE
  hi PmenuSbar ctermfg=196 ctermbg=236 cterm=NONE
  hi PmenuSel ctermfg=16 ctermbg=192 cterm=NONE
  hi PmenuThumb ctermfg=196 ctermbg=250 cterm=NONE
  hi PreProc ctermfg=174 ctermbg=NONE cterm=NONE
  hi Question ctermfg=46 ctermbg=NONE cterm=bold
  hi Search ctermfg=16 ctermbg=247 cterm=NONE
  hi Special ctermfg=111 ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=238 ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=231 ctermbg=52 cterm=underline
  hi SpellCap ctermfg=231 ctermbg=24 cterm=underline
  hi SpellLocal ctermfg=231 ctermbg=23 cterm=underline
  hi SpellRare ctermfg=231 ctermbg=53 cterm=underline
  hi Statement ctermfg=111 ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=231 ctermbg=33 cterm=bold
  hi StatusLineNC ctermfg=247 ctermbg=236 cterm=NONE
  hi StatusLineTerm ctermfg=16 ctermbg=149 cterm=bold
  hi StatusLineTermNC ctermfg=16 ctermbg=149 cterm=NONE
  hi String ctermfg=223 ctermbg=NONE cterm=NONE
  hi TabLine ctermfg=247 ctermbg=59 cterm=NONE
  hi TabLineFill ctermfg=NONE ctermbg=238 cterm=NONE
  hi TabLineSel ctermfg=231 ctermbg=16 cterm=NONE
  hi Title ctermfg=185 ctermbg=NONE cterm=bold
  hi Todo ctermfg=185 ctermbg=236 cterm=NONE
  hi Type ctermfg=192 ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=111 ctermbg=NONE cterm=NONE
  hi User1 ctermfg=243 ctermbg=236 cterm=NONE
  hi VertSplit ctermfg=236 ctermbg=235 cterm=NONE
  hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
  hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=underline
  hi WarningMsg ctermfg=208 ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=16 ctermbg=226 cterm=NONE
  hi cFormat ctermfg=223 ctermbg=NONE cterm=bold
  hi cSpecial ctermfg=223 ctermbg=NONE cterm=bold
  hi debugBreakpoint ctermfg=250 ctermbg=52 cterm=NONE
  hi debugPC ctermfg=NONE ctermbg=60 cterm=NONE
  hi diffRemoved ctermfg=174 ctermbg=NONE cterm=NONE
  hi diffSubname ctermfg=223 ctermbg=NONE cterm=NONE
  hi gitcommitBranch ctermfg=139 ctermbg=NONE cterm=NONE
  hi helpBacktick ctermfg=111 ctermbg=NONE cterm=NONE
  hi helpCommand ctermfg=111 ctermbg=NONE cterm=NONE
  hi helpExample ctermfg=111 ctermbg=NONE cterm=NONE
  hi helpHeader ctermfg=231 ctermbg=NONE cterm=NONE
  hi helpHyperTextEntry ctermfg=139 ctermbg=NONE cterm=NONE
  hi helpHyperTextJump ctermfg=80 ctermbg=NONE cterm=NONE
  hi helpNotVi ctermfg=243 ctermbg=NONE cterm=NONE
  hi helpOption ctermfg=223 ctermbg=NONE cterm=NONE
  hi helpSpecial ctermfg=223 ctermbg=NONE cterm=NONE
  hi helpStart ctermfg=139 ctermbg=NONE cterm=NONE
  hi helpURL ctermfg=174 ctermbg=NONE cterm=NONE
  hi rcMainObject ctermfg=231 ctermbg=NONE cterm=NONE
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=243 cterm=underline
  hi ToolbarButton ctermfg=16 ctermbg=250 cterm=bold
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 8
  if get(g:, 'wombatmod_transp_bg', 0)
    hi Normal ctermfg=Gray ctermbg=NONE cterm=NONE
    hi NonText ctermfg=DarkGray ctermbg=NONE cterm=NONE
    hi LineNr ctermfg=DarkGray ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=DarkGray ctermbg=NONE cterm=NONE
    hi Terminal ctermfg=Gray ctermbg=NONE cterm=NONE
  else
    hi Normal ctermfg=Gray ctermbg=Black cterm=NONE
    hi NonText ctermfg=DarkGray ctermbg=Black cterm=NONE
    hi LineNr ctermfg=DarkGray ctermbg=Black cterm=NONE
    hi SignColumn ctermfg=DarkGray ctermbg=Black cterm=NONE
    hi Terminal ctermfg=Gray ctermbg=Black cterm=NONE
  endif
  hi Terminal ctermfg=Gray ctermbg=Black cterm=NONE
  hi ColorColumn ctermfg=fg ctermbg=DarkRed cterm=NONE
  hi Comment ctermfg=DarkGray ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Constant ctermfg=Red ctermbg=NONE cterm=NONE
  hi Cursor ctermfg=Black ctermbg=Gray cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=DarkGray cterm=NONE
  hi CursorLine ctermfg=NONE ctermbg=DarkGray cterm=NONE
  hi CursorLineSign ctermfg=NONE ctermbg=DarkGray cterm=NONE
  hi CursorLineFold ctermfg=NONE ctermbg=DarkGray cterm=NONE
  hi CursorLineNr ctermfg=Gray ctermbg=DarkGray cterm=NONE
  hi DiffAdd ctermfg=White ctermbg=DarkGreen cterm=NONE
  hi DiffChange ctermfg=White ctermbg=Gray cterm=NONE
  hi DiffDelete ctermfg=White ctermbg=DarkRed cterm=NONE
  hi DiffText ctermfg=White ctermbg=DarkCyan cterm=NONE
  hi Directory ctermfg=Cyan ctermbg=NONE cterm=NONE
  hi Error ctermfg=White ctermbg=Red cterm=NONE
  hi ErrorMsg ctermfg=Red ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=DarkGray ctermbg=Black cterm=NONE
  hi Folded ctermfg=Gray ctermbg=DarkGray cterm=NONE
  hi Function ctermfg=Green ctermbg=NONE cterm=NONE
  hi Identifier ctermfg=Green ctermbg=NONE cterm=NONE
  hi Ignore ctermfg=White ctermbg=NONE cterm=NONE
  hi IncSearch ctermfg=NONE ctermbg=NONE cterm=reverse
  hi Keyword ctermfg=Blue ctermbg=NONE cterm=NONE
  hi LineNrAbove ctermfg=DarkGray ctermbg=Black cterm=NONE
  hi LineNrBelow ctermfg=DarkGray ctermbg=Black cterm=NONE
  hi MatchParen ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ModeMsg ctermfg=White ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=White ctermbg=NONE cterm=NONE
  hi Number ctermfg=Red ctermbg=NONE cterm=NONE
  hi Pmenu ctermfg=White ctermbg=DarkGray cterm=NONE
  hi PmenuSbar ctermfg=Red ctermbg=DarkGray cterm=NONE
  hi PmenuSel ctermfg=Black ctermbg=Green cterm=NONE
  hi PmenuThumb ctermfg=Red ctermbg=Gray cterm=NONE
  hi PreProc ctermfg=Red ctermbg=NONE cterm=NONE
  hi Question ctermfg=Green ctermbg=NONE cterm=bold
  hi Search ctermfg=Black ctermbg=Gray cterm=NONE
  hi Special ctermfg=Blue ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=DarkGray ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=White ctermbg=DarkRed cterm=underline
  hi SpellCap ctermfg=White ctermbg=DarkBlue cterm=underline
  hi SpellLocal ctermfg=White ctermbg=Cyan cterm=underline
  hi SpellRare ctermfg=White ctermbg=Magenta cterm=underline
  hi Statement ctermfg=Blue ctermbg=NONE cterm=NONE
  hi StatusLine ctermfg=White ctermbg=DarkBlue cterm=bold
  hi StatusLineNC ctermfg=DarkGray ctermbg=DarkBlue cterm=NONE
  hi StatusLineTerm ctermfg=Black ctermbg=Green cterm=bold
  hi StatusLineTermNC ctermfg=Black ctermbg=Green cterm=NONE
  hi String ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi TabLine ctermfg=Gray ctermbg=DarkGray cterm=NONE
  hi TabLineFill ctermfg=NONE ctermbg=DarkGray cterm=NONE
  hi TabLineSel ctermfg=White ctermbg=Black cterm=NONE
  hi Title ctermfg=Yellow ctermbg=NONE cterm=bold
  hi Todo ctermfg=Yellow ctermbg=DarkGray cterm=NONE
  hi Type ctermfg=Green ctermbg=NONE cterm=NONE
  hi Underlined ctermfg=Blue ctermbg=NONE cterm=NONE
  hi User1 ctermfg=DarkGray ctermbg=DarkGray cterm=NONE
  hi VertSplit ctermfg=DarkGray ctermbg=DarkGray cterm=NONE
  hi Visual ctermfg=NONE ctermbg=NONE cterm=reverse
  hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=underline
  hi WarningMsg ctermfg=Brown ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=Black ctermbg=Yellow cterm=NONE
  hi cFormat ctermfg=DarkYellow ctermbg=NONE cterm=bold
  hi cSpecial ctermfg=DarkYellow ctermbg=NONE cterm=bold
  hi debugBreakpoint ctermfg=Gray ctermbg=DarkRed cterm=NONE
  hi debugPC ctermfg=NONE ctermbg=DarkBlue cterm=NONE
  hi diffRemoved ctermfg=Red ctermbg=NONE cterm=NONE
  hi diffSubname ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi gitcommitBranch ctermfg=Magenta ctermbg=NONE cterm=NONE
  hi helpBacktick ctermfg=Blue ctermbg=NONE cterm=NONE
  hi helpCommand ctermfg=Blue ctermbg=NONE cterm=NONE
  hi helpExample ctermfg=Blue ctermbg=NONE cterm=NONE
  hi helpHeader ctermfg=White ctermbg=NONE cterm=NONE
  hi helpHyperTextEntry ctermfg=Magenta ctermbg=NONE cterm=NONE
  hi helpHyperTextJump ctermfg=Cyan ctermbg=NONE cterm=NONE
  hi helpNotVi ctermfg=DarkGray ctermbg=NONE cterm=NONE
  hi helpOption ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi helpSpecial ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi helpStart ctermfg=Magenta ctermbg=NONE cterm=NONE
  hi helpURL ctermfg=Red ctermbg=NONE cterm=NONE
  hi rcMainObject ctermfg=White ctermbg=NONE cterm=NONE
  hi CursorIM ctermfg=NONE ctermbg=fg cterm=NONE
  hi ToolbarLine ctermfg=NONE ctermbg=DarkGray cterm=underline
  hi ToolbarButton ctermfg=Black ctermbg=Gray cterm=bold
  hi Visual ctermfg=Black ctermbg=Gray cterm=NONE
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 0
  hi Normal term=NONE
  hi ColorColumn term=reverse
  hi Conceal term=NONE
  hi Cursor term=NONE
  hi CursorColumn term=reverse
  hi CursorLine term=underline
  hi CursorLineNr term=bold,italic,reverse,underline
  hi DiffAdd term=reverse,underline
  hi DiffChange term=reverse,underline
  hi DiffDelete term=reverse,underline
  hi DiffText term=bold,reverse,underline
  hi Directory term=NONE
  hi EndOfBuffer term=NONE
  hi ErrorMsg term=bold,italic,reverse
  hi FoldColumn term=reverse
  hi Folded term=italic,reverse,underline
  hi IncSearch term=bold,italic,reverse
  hi LineNr term=reverse
  hi MatchParen term=bold,underline
  hi ModeMsg term=NONE
  hi MoreMsg term=NONE
  hi NonText term=NONE
  hi Pmenu term=reverse
  hi PmenuSbar term=NONE
  hi PmenuSel term=NONE
  hi PmenuThumb term=NONE
  hi PopupSelected term=reverse
  hi Question term=standout
  hi Search term=italic,underline
  hi SignColumn term=reverse
  hi SpecialKey term=bold
  hi SpellBad term=italic,underline
  hi SpellCap term=italic,underline
  hi SpellLocal term=italic,underline
  hi SpellRare term=italic,underline
  hi StatusLine term=bold,reverse
  hi StatusLineNC term=reverse
  hi TabLine term=italic,reverse,underline
  hi TabLineFill term=reverse,underline
  hi TabLineSel term=bold
  hi Title term=bold
  hi VertSplit term=reverse
  hi Visual term=reverse
  hi VisualNOS term=NONE
  hi WarningMsg term=standout
  hi WildMenu term=bold
  hi Comment term=italic
  hi Constant term=bold,italic
  hi Error term=reverse
  hi Identifier term=italic
  hi Ignore term=NONE
  hi PreProc term=italic
  hi Special term=bold,italic
  hi Statement term=bold
  hi Todo term=bold,underline
  hi Type term=bold
  hi Underlined term=underline
  hi CursorIM term=NONE
  hi ToolbarLine term=reverse
  hi ToolbarButton term=bold,reverse
  if !s:italics
    hi CursorLineNr term=bold,reverse,underline
    hi ErrorMsg term=bold,reverse
    hi Folded term=reverse,underline
    hi IncSearch term=bold,reverse
    hi Search term=underline
    hi SpellBad term=underline
    hi SpellCap term=underline
    hi SpellLocal term=underline
    hi SpellRare term=underline
    hi TabLine term=reverse,underline
    hi Comment term=NONE
    hi Constant term=bold
    hi Identifier term=NONE
    hi PreProc term=NONE
    hi Special term=bold
  endif
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: black          #000000 ~       Black
" Color: red            #d28c83 ~       Red
" Color: orange         #ffcc99 ~       DarkYellow
" Color: yellow         #dddd77 ~       Yellow
" Color: lightyellow    #dddd77 ~       Yellow
" Color: green          #cae682 192     Green
" Color: cyan           #55d4cb ~       Cyan
" Color: blue           #8ac6f2 111     Blue
" Color: purple         #b984b1 ~       Magenta
" Color: orchid         #b984b1 ~       Magenta
" Color: gray1          #0c0c0c ~       Black
" Color: gray2          #111111 ~       Black
" Color: gray3          #1c1c1c ~       Black
" Color: gray4          #222222 ~       DarkGray
" Color: gray5          #2d2d2d ~       DarkGray
" Color: gray6          #333333 ~       DarkGray
" Color: gray7          #444444 ~       DarkGray
" Color: gray8          #5c5c5c ~       DarkGray
" Color: gray9          #777777 ~       DarkGray
" Color: gray10         #999999 ~       Gray
" Color: gray11         #bcbcbc ~       Gray
" Color: white          #ffffff ~       White
" Color: full_red       #ff0000 ~       Red
" Color: full_green     #00ff00 ~       Green
" Color: full_blue      #0000ff ~       Blue
" Color: full_yellow    #ffff00 ~       Yellow
" Color: full_pink      #ff00ff ~       Magenta
" Color: folded_fg      #a0a8b0 ~       Gray
" Color: folded_bg      #384048 ~       DarkGray
" Color: status_bg      #4e8cd6 33      DarkBlue
" Color: statusnc_bg    #333333 ~       DarkGray
" Color: tstatus_bg     #cae682 ~       Green
" Color: colorcol_bg    #990000 ~       DarkRed
" Color: warning_fg     #ff9933 ~       Brown
" Color: visual_fg      #000000 ~       Black
" Color: visual_bg      #999999 ~       Gray
" Color: difftext_bg    #669999 ~       DarkCyan
" Color: diffchange_bg  #336666 ~       Gray
" Color: diffdelete_bg  #663333 ~       DarkRed
" Color: diffadd_bg     #336633 ~       DarkGreen
" Color: spell_bad      #660000 ~       DarkRed
" Color: spell_bad_sp   #ff0000 ~       DarkRed
" Color: spell_cap      #004d80 ~       DarkBlue
" Color: spell_cap_sp   #56bcff ~       DarkBlue
" Color: spell_local    #006666 ~       Cyan
" Color: spell_local_sp #00ffff ~       Cyan
" Color: spell_rare     #660066 ~       Magenta
" Color: spell_rare_sp  #ff00ff ~       Magenta
" Color: debug_pc_bg    #263760 ~       DarkBlue
" Color: debug_bp_bg    #660000 ~       DarkRed
" Color: tc_0           #000000 ~       Black
" Color: tc_1           #aa0000 ~       Darkred
" Color: tc_2           #00aa00 ~       Darkgreen
" Color: tc_3           #aa5500 ~       Darkyellow
" Color: tc_4           #5c5cff ~       Darkblue
" Color: tc_5           #aa00aa ~       Darkmagenta
" Color: tc_6           #00aaaa ~       Darkcyan
" Color: tc_7           #b5b5b5 ~       Gray
" Color: tc_8           #555555 ~       Darkgray
" Color: tc_9           #ff5555 ~       Red
" Color: tc_10          #7ef27e ~       Green
" Color: tc_11          #ffff55 ~       Yellow
" Color: tc_12          #7575f0 ~       Blue
" Color: tc_13          #ff55ff ~       Magenta
" Color: tc_14          #55ffff ~       Cyan
" Color: tc_15          #ffffff ~       White
" Term colors: tc_0 tc_1 tc_2 tc_3 tc_4 tc_5 tc_6 tc_7
" Term colors: tc_8 tc_9 tc_10 tc_11 tc_12 tc_13 tc_14 tc_15
" vim: et ts=2 sw=2
