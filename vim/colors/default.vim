highlight StatusLine cterm = NONE ctermfg = LightGray ctermbg = DarkBlue
highlight StatusLine gui   = NONE guifg   = LightGray   guibg = DarkBlue

function! HiStatusLine(mode)
    if a:mode == 'v' || a:mode == 'V' || a:mode == ''
        highlight StatusLine ctermbg = Blue
        highlight StatusLine guibg   = Blue
    elseif a:mode == 'i' || a:mode == 'R'
        highlight StatusLine ctermbg = DarkBlue
        highlight StatusLine guibg   = DarkBlue
    else
        highlight StatusLine ctermbg = DarkGreen
        highlight StatusLine guibg   = DarkGreen
    endif

    return ""
endfunction

highlight ColorColumn ctermbg = Black guibg = Black

"completion popup color
highlight Pmenu    cterm = NONE ctermfg = Black ctermbg = White
highlight PmenuSel cterm = NONE ctermfg = White ctermbg = DarkGray

highlight Pmenu    gui = NONE guifg = Black guibg = White
highlight PmenuSel gui = NONE guifg = White guibg = DarkGray
