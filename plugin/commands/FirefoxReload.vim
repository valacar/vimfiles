" Plugin to create a command that reloads Firefox with F5 key
" Requires xdotool to be installed.

if exists('g:loaded_firefoxreload_command')
  finish
endif

let g:loaded_firefoxreload_command = 1

command! FirefoxReload call system('xdotool search "Mozilla Firefox" key F5')
command! ReloadFirefox FirefoxReload

