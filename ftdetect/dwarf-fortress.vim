" ftdetect for Dwarf Fortress txt files.
" syntax files at https://github.com/kazimuth/dwarffortress.vim

autocmd BufRead,BufNewFile */dwarf_fortress*/*.txt,*/df_linux/*.txt
      \ call s:DwarfFortressDetect() |
      \ hi link dfTokenStart String |
      \ hi link dfTokenEnd String |
      \ hi link dfTokenFront NONE |
      \ hi link dfHeaderError NONE

function s:DwarfFortressDetect()
    " read first 20 lines
    let l:contents = readfile(expand(@%), '', 20)
    " look for [SOMETHING:
    if match(l:contents, '\V[\w\+:') != -1
        set filetype=dwarffortress
    endif
endfunction

