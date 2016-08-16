set lines=45 columns=120

set guifont=Ubuntu\ Mono\ 14

set guicursor=a:blinkon0

" guitabs
set guioptions-=e

highlight ColorColumn guibg=Black

highlight Pmenu    gui=NONE guifg=Black guibg=White
highlight PmenuSel gui=NONE guifg=White guibg=Black

highlight Visual gui=bold guifg=bg guibg=fg

highlight StatusLine gui=NONE guifg=White

function! HiStatusLine(mode)
    if a:mode == 'v' || a:mode == 'V' || a:mode == ''
        highlight StatusLine guibg=Blue
    elseif a:mode == 'i' || a:mode == 'R'
        highlight StatusLine guibg=DarkCyan
    else
        highlight StatusLine guibg=DarkBlue
    endif

    return ""
endfunction
