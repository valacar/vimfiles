" ftdetect for Markdeep files

" vint: -ProhibitAutocmdWithNoGroup

" use regular markdown syntax until I find something better
autocmd BufRead,BufNewFile *.md.html set filetype=markdown
