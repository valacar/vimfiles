" Same as eslint, but don't add --stdin-filename

" TODO: how do I make this a local function and have command_callback call it?
" XXX: this is global function isn't it?
function! MyEslintGetCommand(buffer) abort
    let l:executable = ale#handlers#eslint#GetExecutable(a:buffer)

    let l:options = ale#Var(a:buffer, 'javascript_eslint_options')

    return ale#node#Executable(a:buffer, l:executable)
    \   . (!empty(l:options) ? ' ' . l:options : '')
    \   . ' -f unix --stdin'
endfunction

if exists("*ale#linter#Define")
  call ale#linter#Define('javascript', {
  \   'name': 'my-eslint',
  \   'output_stream': 'both',
  \   'executable_callback': 'ale#handlers#eslint#GetExecutable',
  \   'command_callback': 'MyEslintGetCommand',
  \   'callback': 'ale#handlers#eslint#Handle',
  \})
endif
