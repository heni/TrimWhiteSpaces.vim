"remove trailing whitespace for source code on file save
function! TrimWhiteSpaces()
    let l = line(".")
    let c = line(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

augroup trimWhiteSpaces
    autocmd!
    autocmd BufReadPre * let b:trimWhiteSpaceAllowed = 0 
    autocmd FileType c,cpp,java,php,ruby,python,sh,scala let b:trimWhiteSpaceAllowed = 1
    autocmd BufWritePre * if exists("b:trimWhiteSpaceAllowed") && b:trimWhiteSpaceAllowed | call TrimWhiteSpaces() | endif
    "workaround: by some reason last BufWritePre command isn't executed
    autocmd BufWritePre * |
augroup END
