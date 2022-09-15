vim9script

# stolen from habamax's config at:
# https://github.com/habamax/.vim/blob/a385d1a9d2c559f11cfd7cbe5de6e7dd0ce838e3/autoload/text.vim

# Toggle current word
export def Toggle()
    var toggles = {
        true: 'false', false: 'true', True: 'False', False: 'True', TRUE: 'FALSE', FALSE: 'TRUE',
        yes: 'no', no: 'yes', Yes: 'No', No: 'Yes', YES: 'NO', NO: 'YES',
        on: 'off', off: 'on', On: 'Off', Off: 'On', ON: 'OFF', OFF: 'ON',
        open: 'close', close: 'open', Open: 'Close', Close: 'Open',
        dark: 'light', light: 'dark',
        width: 'height', height: 'width',
        first: 'last', last: 'first',
        top: 'right', right: 'bottom', bottom: 'left', left: 'center', center: 'top',
    }
    var word = expand("<cword>")
    if toggles->has_key(word)
        execute 'normal! "_ciw' .. toggles[word]
    endif
enddef
