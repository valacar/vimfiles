" Make localized keys appear as comments for easier viewing
syn match dtLocaleKey "^\s*[A-Za-z0-9-]\+\[.\{-}\]\s*=\s*.*$"
hi link dtLocaleKey Comment
