if !exists("g:sessions_path")
    let g:sessions_path = expand("$HOME/.vim/sessions")
endif

let g:sessions_path = fnamemodify(g:sessions_path, ":p")

if !isdirectory(g:sessions_path)
    call mkdir(g:sessions_path, "p")
endif

nnoremap <leader>s :call sessions#saveSession(g:sessions_path)<CR>
nnoremap <leader>l :call sessions#loadSession(g:sessions_path)<CR>
nnoremap <leader>r :call sessions#removeSession(g:sessions_path)<CR>
