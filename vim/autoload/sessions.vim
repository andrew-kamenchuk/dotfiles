function! sessions#getSessionsList(sessions_path)
    return sort(globpath(a:sessions_path, "*.vim", 1, 1))
endfunction

function! sessions#selectSession(sessions_path)
    let l:sessions = sessions#getSessionsList(a:sessions_path)

    let l:llen = len(l:sessions)

    if 0 == l:llen
        return
    elseif 1 == l:llen
        return l:sessions[0]
    else
        let l:names = map(copy(l:sessions), "fnamemodify(v:val, ':t:r')")

        echo "\nSelect session:"
        let l:i = inputlist([''] + map(l:names, "join([v:key + 1, v:val], ': ')"))

        if l:i > 0 && l:i <= l:llen
            return l:sessions[l:i - 1]
        endif
    endif
endfunction

function! sessions#saveSession(sessions_path)
    if !empty(v:this_session)
        \ && 1 == confirm("Found " . v:this_session . "\nSave?", "&Yes\n&No", 1)
        execute "mksession! " . v:this_session
    else
        let l:session = sessions#selectSession(a:sessions_path)

        if !empty(l:session)
            execute "mksession! " . l:session
        else
            let l:root = fnamemodify(functions#findProjectRoot("%"), ":t")

            let l:name = input("Enter session name: ", l:root)

            if !empty(l:name)
                execute "mksession " . a:sessions_path . l:name . ".vim"
            endif
        endif
    endif
endfunction

function! sessions#loadSession(sessions_path)
    let l:session = sessions#selectSession(a:sessions_path)

    if !empty(l:session)
        execute "source " . l:session
    endif
endfunction

function! sessions#removeSession(sessions_path)
    let l:session = sessions#selectSession(a:sessions_path)
    if !empty(l:session)
        return delete(l:session)
    endif
endfunction

function! sessions#reloadSession()
    if !empty(v:this_session)
        execute "source " . v:this_session
    endif
endfunction
