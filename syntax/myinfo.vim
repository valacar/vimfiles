" .info documentation file syntax
"
" Warning: I have no idea what this should look like!
"          I'm just trying to make it easier for me to read .info files on
"          Windows without access to man or groff or whatever Linux users
"          typically use to view them.

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax match infoBold /`[^']\+'/hs=s+1,he=e-1  contains=infoBacktick,infoSingleQuote
syntax match infoBacktick /`/  contained conceal
syntax match infoSingleQuote /'/  contained conceal
syntax match infoColon /:/ contained conceal
syntax match infoPageChar /^/ conceal
syntax match infoSectionFooter /^File: \w\+\.info,.\+/
syntax match infoHeader1Underline /^\*\{3,\}$/
syntax match infoHeader2Underline /^=\{3,\}$/
syntax match infoHeader3Underline /^-\{3,\}$/
syntax match infoHeader4Underline /^\.\{3,\}$/

syntax match infoLink1 /\* [^:]\+:$/he=e-1 contains=infoColon
syntax match infoLink2 /\* [^:]\+::/he=e-2 contains=infoColon
syntax region infoNote start="\*[nN]ote" end="::\?"


hi default infoHeader1Underline guifg=#ffff33 guibg=NONE
hi default infoHeader2Underline guifg=#00ff00 guibg=NONE
hi default infoHeader3Underline guifg=#009999 guibg=NONE
hi default infoHeader4Underline guifg=#336699 guibg=NONE

hi default infoLink1 guifg=#ff66ff guibg=NONE
hi default infoLink2 guifg=#cc33cc guibg=NONE

hi infoNote guifg=#999999 guibg=NONE

hi default infoSectionFooter guifg=#666666 guibg=NONE
hi default infoBold guifg=#ffffff guibg=NONE gui=bold

let b:current_syntax = "myinfo"

" TODO: put these in ftplugin folder
setlocal conceallevel=2
setlocal concealcursor+=n
