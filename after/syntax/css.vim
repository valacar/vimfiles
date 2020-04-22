" Add '-' to keyword characters so something like text-align gets highlighted
" properly. Unfortunately doesn't seem to fix vendor prefixes like -webkit-.
syntax iskeyword @,48-57,_,192-255,-
