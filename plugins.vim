set nocompatible
filetype off

if !filereadable(expand('~/.vim/bundle/neobundle.vim/README.md'))
    echon "Installing plugin manager..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim/
    echo "Done"
endif

set runtimepath^=~/.vim/bundle/neobundle.vim/

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {'build': 'make'}

NeoBundle 'Shougo/unite.vim'
    let g:unite_enable_start_insert = 1
    let g:unite_split_rule = "botright"
    let g:unite_winheight = 10
    let g:unite_candidate_icon="▷"

NeoBundle 'tsukkee/unite-tag'
 
NeoBundle 'freitass/todo.txt-vim'

" <leader>c<space>, <leader>cm, <leader>cs, <leader>cA, <leader>cu
NeoBundle 'scrooloose/nerdcommenter'

NeoBundle 'editorconfig/editorconfig-vim'

NeoBundle 'nathanaelkane/vim-indent-guides'
    let g:indent_guides_start_label = 2
    let g:indent_guides_guide_size  = 2

NeoBundle 'mhinz/vim-startify'
    let g:startify_bookmarks = ['~/.vimrc', '~/.vim/plugins.vim', '~/.zshrc', '~/Documents/Grive/todo/todo.txt']

NeoBundle "w0ng/vim-hybrid"
NeoBundle "endel/vim-github-colorscheme"

NeoBundle 'godlygeek/tabular'

" <C-n>
NeoBundle 'terryma/vim-multiple-cursors'

" cs'"
NeoBundle 'tpope/vim-surround'

" <leader><leader>w, <leader><leader>f..., 
NeoBundle 'Lokaltog/vim-easymotion'

NeoBundle 'matze/vim-move'

NeoBundle 'majutsushi/tagbar'

NeoBundle 'mbbill/undotree'

NeoBundle 'jiangmiao/auto-pairs.git'

" :StackAnswers 'how to ...'
NeoBundle 'james9909/stackanswers.vim'

NeoBundle 'scrooloose/syntastic'
    let g:syntastic_enable_signs   = 1
    let g:syntastic_php_checkers   = ['php', 'phpcs']
    let g:syntastic_php_phpcs_args = ['--standard=PSR2']
    let g:syntastic_js_checkers    = ['jshint']

NeoBundle 'joonty/vdebug'
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

NeoBundle 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-tab>"
    let g:UltiSnipsListSnippets="<c-l>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    let g:UltiSnipsEditSplit="vertical"

NeoBundle 'honza/vim-snippets'

NeoBundle 'sheerun/vim-polyglot'

" completion
NeoBundle 'Valloric/YouCompleteMe', {'build': './install.py --clang-completer'}
    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_auto_trigger = 1
    let g:ycm_autoclose_preview_window_after_completion = 1

" java
NeoBundle 'artur-shaik/vim-javacomplete2'

autocmd vimrc FileType java setlocal omnifunc=javacomplete#Complete

" python
NeoBundle 'klen/python-mode'
    let g:pymode_rope = 0

" php
NeoBundle 'arnaud-lb/vim-php-namespace'

NeoBundle 'shawncplus/phpcomplete.vim'
    let g:phpcomplete_relax_static_constraint = 1
    let g:phpcomplete_parse_docblock_comments = 1

autocmd vimrc FileType php setlocal omnifunc=phpcomplete#CompletePHP

NeoBundle 'alvan/vim-php-manual'

" NeoBundle 'mikehaertl/yii2-apidoc-vim'

NeoBundle 'dominics/vim-filetype-xdebug'

" css
NeoBundle 'gorodinskiy/vim-coloresque'

NeoBundle 'hail2u/vim-css3-syntax'

" html
NeoBundle 'mattn/emmet-vim'
    let g:user_emmet_expandabbr_key = '<c-e>'

NeoBundle 'othree/html5.vim'

NeoBundle 'Valloric/MatchTagAlways'

" js
NeoBundle 'pangloss/vim-javascript'

NeoBundle 'othree/javascript-libraries-syntax.vim'

" vcs tools
NeoBundle 'vim-scripts/vcscommand.vim'

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'mhinz/vim-signify'
    let g:signify_vcs_list = ['svn']

" :Gist
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck
