" TODO: install vim-abolish?
"           <bad> <good>
inoreabbrev seperate separate
inoreabbrev seperated separated
inoreabbrev seperating separating
inoreabbrev definate definite
inoreabbrev definately definitely
inoreabbrev recieve receive
inoreabbrev recieved received
inoreabbrev recieving receiving
inoreabbrev truely truly
inoreabbrev wierd weird
inoreabbrev neccessary necessary
inoreabbrev neccesary necessary
inoreabbrev neccesarily necessarily
inoreabbrev calender calendar
inoreabbrev appearence appearance
inoreabbrev embarass embarrass
inoreabbrev embarassed embarrassed
inoreabbrev embarassing embarrassing
inoreabbrev embarassingly embarrassingly
inoreabbrev dissapear disappear
inoreabbrev dissapeared disappeared
inoreabbrev dissapearing disappearing
inoreabbrev accidently accidentally
inoreabbrev refered referred
inoreabbrev refering referring
inoreabbrev mispell misspell
inoreabbrev mispelled misspelled
inoreabbrev mispelling misspelling
inoreabbrev boundry boundary
inoreabbrev boundries boundaries
inoreabbrev opposit opposite
inoreabbrev hexidecimal hexadecimal
inoreabbrev occuring occurring
inoreabbrev occured occurred
inoreabbrev occurance occurrence
inoreabbrev aweful awful
inoreabbrev existance existence
inoreabbrev garantee guarantee
inoreabbrev garanteed guaranteed
inoreabbrev recomend recommend
inoreabbrev speach speech
inoreabbrev speaches speeches
inoreabbrev aquire acquire
inoreabbrev aquired acquired
inoreabbrev aquiring acquiring
inoreabbrev relavent relevant
inoreabbrev relavent relevant
inoreabbrev hesitent hesitant


" Autocorrect :man to :help
cnoreabbrev man <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'help' : 'man')<CR>
