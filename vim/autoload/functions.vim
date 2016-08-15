" different functions

function! functions#findGitRepoPath(file)
    let l:git = finddir(".git/", a:file . ";")

    if !empty(l:git)
        return fnamemodify(l:git, ":p:h:h")
    endif
endfunction

function! functions#findProjectRoot(file)
    let l:abs = resolve(fnamemodify(expand(a:file), ":p"))
    let l:git = functions#findGitRepoPath(l:abs)

    if !empty(l:git)
        return l:git
    endif

    return fnamemodify(l:abs, ":h")
endfunction
