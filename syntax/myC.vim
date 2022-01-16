" Simplified C syntax highlighting

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax match mycOperator /[()!;,=+=&{}<>\[\]*%./\-|~]/

syn region mycString start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ extend
syn match	mycCharacter "'[^']*'"

syn region mycCommentMulti start="/\*" end="\*/" contains=cTodo
syn region mycCommentSingle start="//" skip="\\$" end="$" keepend contains=cTodo
syn keyword mycTodo contained TODO FIXME XXX

syn keyword mycKeyword if else do while for switch case return goto break continue asm
syn keyword mycKeyword struct union enum typedef
syn keyword mycKeyword ifdef ifndef define undef endif include error

let b:current_syntax = 'myC'

" TODO: move these to a colorscheme file
" Best with dark background and medium gray text
" e.g. guibg=#1c1c1c guifg=bcbcbc
hi default mycString guifg=Bisque
hi default mycCharacter guifg=Bisque
hi default mycKeyword guifg=LightGrey gui=bold
hi default mycOperator guifg=LightBlue
hi default mycComment guifg=#666666
hi default link mycCommentMulti mycComment
hi default link mycCommentSingle mycComment
