" Simplified C syntax highlighting

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

syntax match mycOperator /[()!;,=+=&{}<>\[\]*%./\-]/

syn region mycString start=+\(L\|u\|u8\|U\|R\|LR\|u8R\|uR\|UR\)\="+ skip=+\\\\\|\\"+ end=+"+ extend

syn region mycCommentMulti start="/\*" end="\*/" contains=cTodo
syn region mycCommentSingle start="//" skip="\\$" end="$" keepend contains=cTodo
syn keyword mycTodo contained TODO FIXME XXX

syn keyword mycKeyword if else do while for switch case return goto break continue asm
syn keyword mycKeyword struct union enum typedef
syn keyword mycKeyword ifdef ifndef define undef endif include error

let b:current_syntax = 'myC'

hi default mycString guifg=#f0d0bb
hi default mycKeyword guifg=#ffffff gui=bold
hi default mycOperator guifg=#aaaaaa
hi default mycComment guifg=#666666
hi default link mycCommentMulti mycComment
hi default link mycCommentSingle mycComment

