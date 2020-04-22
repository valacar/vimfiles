" Plugin to create a command that reloads Firefox with F5 key
" Requires xdotool to be installed on Linux. Previously it worked
" on Windows using Autohotkey, but I don't use Windows anymore.

if exists('g:loaded_firefoxreload_command')
  finish
endif

let g:loaded_firefoxreload_command = 1

command! FirefoxReload call system('xdotool search "Mozilla Firefox" key F5')
command! ReloadFirefox FirefoxReload


" Below is a really horrible attempt to make this work on both Windows and Linux.
" Keeping it commented out in case I ever want to make it work on Windows again.


" let s:commands = ['xdotool', 'autohotkey']

"let s:tool = ''
"for s:command in s:commands
"  if executable(s:command)
"    s:tool = s:command
"  endif
"endfor

"if s:tool
"  command! FirefoxReload call s:FirefoxReload()
"  command! ReloadFirefox call s:FirefoxReload()

"  function! s:FirefoxReload()
"    if s:tool == 'autohotkey'
"      let ahk_script = 'D:/Documents/Mark/AutoHotkey Scripts/firefox-reload.ahk'
"        if filereadable(ahk_script)
"          execute '!start /b autohotkey ' . '"' . ahk_script . '"'
"        else
"          echom ahk_script . " not found."
"      endif
"    elseif s:tool === "xdotool"
"      echom 'running xdotool search "Mozilla Firefox" key F5'
"      " TODO: run xdotool search "Mozilla Firefox" key F5
"    endif
"  endfunction
"endif

" firefox-reload.ahk

" Process, Exist, firefox.exe
" pid = %ErrorLevel%
" if (pid != 0) {
"     ControlSend,,{F5},ahk_pid %pid%
" } else {
"     FileAppend, Can't find Firefox, *
" }

