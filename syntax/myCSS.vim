" Simplified CSS syntax highlighting
" The main focus is on the declaration block, with properties in one color, and values one color.
" Selectors are ignored because I don't care to distinguish things like classes, id's and tags.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" TODO: at-rules (currently breaks things if present)
" https://developer.mozilla.org/en-US/docs/tag/At-rule

syn match mycssImportant /!important/ contained
syn match mycssProperty /[^:]\+:/ contained
syn region mycssDefinition contains=mycssImportant,mycssProperty,mycssComment matchgroup=mycssBraces start='{' end='}'


" Comment
syn region mycssComment start="/\*" end="\*/" contains=@Spell fold

let b:current_syntax = "myCSS"

syn sync minlines=10


hi! default link mycssImportant Boolean
hi! default link mycssBraces Normal
hi! default link mycssComment Comment
hi! default link mycssDefinition Function
hi! default link mycssProperty Tag

" :h syn-define
" :h syn-keyword
" :h syn-match
" :h syn-region
" :h syn-arguments

"                        contains  oneline   fold  display  extend concealends
" :syntax keyword             -       -       -       -       -      -
" :syntax match              yes      -      yes     yes     yes     -
" :syntax region             yes     yes     yes     yes     yes    yes
"
" These arguments can be used for all three commands:
" conceal
" cchar
" contained
" containedin
" nextgroup
" transparent
" skipwhite
" skipnl
" skipempty


" au BufWritePost <buffer> :b1 | set syntax=myCSS | b#

