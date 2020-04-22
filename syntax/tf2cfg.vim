" Vim syntax file
" Language: TF2 configuration files
" Maintainer: David Vazgenovich Shakaryan <dvshakaryan@gmail.com>
" Last Change: 2013-04-17

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syntax case ignore

syn keyword tf2Keyword
	\ unbindall
	\ exec
	\ incrementvar multvar
	\ toggle
	\ wait
	\ echo

syn keyword tf2KeywordCont contained
	\ unbindall
	\ exec
	\ incrementvar multvar
	\ toggle
	\ wait
	\ echo

syn keyword tf2Alias nextgroup=tf2AliasName skipwhite
	\ alias

syn keyword tf2AliasCont nextgroup=tf2AliasName skipwhite contained
	\ alias

syn keyword tf2Bind nextgroup=tf2BindKey skipwhite
	\ bind
	\ bindtoggle
	\ unbind

syn keyword tf2BindCont nextgroup=tf2BindKey skipwhite contained
	\ bind
	\ bindtoggle
	\ unbind

syn match tf2CommandSeparator "\;" display

syn match tf2Number "\<\d\+\>" display
syn match tf2Number "\<\d\.\d\+\>" display

syn match tf2Comment "//.*" display

syn region tf2String start=/"/ end=/"/ contains=tf2KeywordCont,tf2AliasCont,tf2BindCont,tf2CommandSeparator display oneline
syn region tf2String start=/""/ end=/""/ contains=tf2KeywordCont,tf2AliasCont,tf2BindCont,tf2CommandSeparator display oneline

syn match tf2AliasDefinition "alias [a-zA-Z0-9_+-\"]\+" contains=tf2AliasName
syn match tf2AliasName "[a-zA-Z0-9_+-\"]\+" contained

syn match tf2BindDefinition "bind [a-zA-Z0-9_+-\"]\+" contains=tf2BindKey
syn match tf2BindKey "[a-zA-Z0-9_\"]\+" contained

hi def link tf2Comment Comment
hi def link tf2Keyword Keyword
hi def link tf2KeywordCont Keyword
hi def link tf2Number Number
hi def link tf2CommandSeparator Character
hi def link tf2Alias Keyword
hi def link tf2AliasCont Keyword
hi def link tf2AliasName Identifier

hi def link tf2Alias Keyword
hi def link tf2AliasCont Keyword
hi def link tf2AliasName Identifier

hi def link tf2Bind Keyword
hi def link tf2BindCont Keyword
hi def link tf2BindKey Identifier

let b:currentsyntax = "tf2cfg"
