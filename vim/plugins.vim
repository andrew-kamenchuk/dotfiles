let s:plugindir = expand("$HOME/.vim/plugins")

let s:deindir   = s:plugindir . "/repos/github.com/Shougo/dein.vim"

if !isdirectory(s:deindir)
    execute "!git clone https://github.com/Shougo/dein.vim " . s:deindir
endif

execute "set runtimepath+=" . s:deindir

call dein#begin(s:plugindir)

call dein#add("Shougo/dein.vim")

call dein#add("Shougo/vimproc.vim", { "build": "make" })

call dein#add("Shougo/unite.vim")
    let g:unite_enable_start_insert = 1
    let g:unite_split_rule = "botright"
    let g:unite_winheight = 20
    let g:unite_candidate_icon="▷ "

    let g:unite_source_menu_menus = {}

    let g:unite_source_menu_menus.git = {"description" : "Git"}
    let g:unite_source_menu_menus.git.command_candidates = {
        \ "git status": "Gstatus",
        \ "git diff"  : "Gdiff",
        \ "git add"   : "Gwrite",
    \}

nnoremap <space> :Unite -start-insert file_rec/async:! command<CR>

call dein#add("tsukkee/unite-tag")

call dein#add("freitass/todo.txt-vim", { "on_ft": "todo" })

" <leader>c<space>, <leader>cs, <leader>cm, <leader>cs, <leader>cA, <leader>cu
call dein#add("scrooloose/nerdcommenter")
    let g:NERDSpaceDelims = 1
    let g:NERDTrimTrailingWhitespace = 1

call dein#add("editorconfig/editorconfig-vim")

call dein#add("mhinz/vim-startify")
    let g:startify_session_dir = expand("$HOME/.vim/sessions")
    let g:startify_list_order = [
        \ [' Sessions: '], 'sessions',
        \ [' Bookmarks: '], 'bookmarks',
        \ [' Commands: '], 'commands',
        \ [' MRU: '], 'files',
        \ [' MRU Current directory: '], 'dir'
    \]
    let g:startify_bookmarks = [
        \ { "v": "~/.vimrc", },
        \ { "p": "~/.vim/plugins.vim", },
        \ { "z": "~/.zsh/.zshrc",},
        \ { "t": "~/Documents/Grive/todo/todo.txt", },
        \ "~/Projects",
    \]

call dein#add("w0ng/vim-hybrid")

call dein#add("godlygeek/tabular")

" cs'"
call dein#add("tpope/vim-surround")

" to repeat surrond
call dein#add("tpope/vim-repeat.git")

" <leader><leader>w, <leader><leader>f...,
call dein#add("Lokaltog/vim-easymotion")

" <A-k> <A-j>
call dein#add("matze/vim-move")

call dein#add("majutsushi/tagbar")
    let g:tagbar_width = 30

call dein#add("mbbill/undotree")

" :StackAnswers 'how to ...'
call dein#add("james9909/stackanswers.vim")

call dein#add("scrooloose/syntastic")
    let g:syntastic_enable_signs        = 1
    let g:syntastic_check_on_open       = 1
    let g:syntastic_aggregate_errors    = 1
    let g:syntastic_php_checkers        = ["php", "phpcs"]
    let g:syntastic_php_phpcs_args      = ["--standard=PSR2"]
    let g:syntastic_javascript_checkers = ["eslint"]
    let g:syntastic_python_python_exec  = "/usr/bin/python3"

call dein#add("joonty/vdebug", { "if": 0 }) " +python
    let g:vdebug_options = {
        \    "port" : 9000, "server" : "localhost",
        \    "timeout" : 25, "on_close" : "detach",
        \    "break_on_open" : 0, "ide_key" : "",
        \    "path_maps" : {}, "debug_window_level" : 0,
        \    "debug_file_level" : 0, "debug_file" : "",
        \    "watch_window_style" : "expanded",
        \    "marker_default" : "⬦", "marker_closed_tree" : "▸",
        \    "marker_open_tree" : "▾",
        \}

call dein#add("SirVer/ultisnips")
    let g:UltiSnipsExpandTrigger="<c-tab>"
    let g:UltiSnipsListSnippets="<c-l>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="horizontal"
    let g:UltiSnipsSnippetsDir="~/.vim/snippets/UltiSnips"

execute "set runtimepath+=" . expand("$HOME/.vim/snippets")

" completion
call dein#add("Valloric/YouCompleteMe", { "build": "./install.py --clang-completer --tern-completer" })
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_auto_trigger = 1
    let g:ycm_autoclose_preview_window_after_completion = 1

" java
call dein#add("artur-shaik/vim-javacomplete2", { "on_ft": "java" })

autocmd vimrc FileType java setlocal omnifunc=javacomplete#Complete

" python
call dein#add("klen/python-mode", { "on_ft": "python" })
    let g:pymode_rope = 0

call dein#add("shawncplus/phpcomplete.vim", { "on_ft": "php" })
    let g:phpcomplete_relax_static_constraint = 1
    let g:phpcomplete_parse_docblock_comments = 1

autocmd vimrc FileType php setlocal omnifunc=phpcomplete#CompletePHP

" <s-k>
call dein#add("alvan/vim-php-manual", { "on_ft": "php" })

" css
call dein#add("gorodinskiy/vim-coloresque", { "on_ft": ["css", "less"] })

" html
call dein#add("mattn/emmet-vim", { "on_ft": ["html", "xml"] })
    let g:user_emmet_expandabbr_key = "<c-e>"

call dein#add("Valloric/MatchTagAlways", { "on_ft": ["html", "xml"] })

" vcs tools
call dein#add("vim-scripts/vcscommand.vim")

call dein#add("tpope/vim-fugitive")

call dein#add("airblade/vim-gitgutter")

call dein#add("mhinz/vim-signify")
    let g:signify_vcs_list = ["svn"]

" :Gist
call dein#add("mattn/webapi-vim")
call dein#add("mattn/gist-vim")

" syntax pack
call dein#add("sheerun/vim-polyglot")

call dein#end()

if dein#check_install()
    call dein#install()
endif
