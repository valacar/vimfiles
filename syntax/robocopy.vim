" RoboCopy job file syntax by Valacar
" (quick, dirty, and hardly any testing done)

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

let b:current_syntax = "robocopy"

" TODO: add keywords for valid switches?
syntax region roboSwitchLine start="\s*\/[A-Za-z]" end="$" contains=roboComment,roboSwitchOption oneline
syntax match roboSwitchOption /:.\+/hs=s+1 contained contains=roboComment
syntax match roboComment /::.*/

highlight default link roboComment Comment
highlight default link roboSwitchLine Statement
highlight default link roboSwitchOption Constant

