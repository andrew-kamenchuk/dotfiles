set nocompatible

set exrc
set secure

set modeline

syntax on

augroup vimrc
  autocmd!
augroup END

source $HOME/.vim/plugins.vim

execute "set runtimepath+=" . expand("$HOME/.vim/snippets")

let s:fzfdir = expand("$ZDOTDIR/.zplug/repos/junegunn/fzf")

if isdirectory(s:fzfdir)
    execute "set runtimepath+=" . s:fzfdir
endif

set background=dark

try
    colorscheme hybrid
catch
    if has("gui_running")
        colorscheme desert
    endif
endtry

colorscheme default

set viminfo='50,/50,:50,<10,n~/.vim/viminfo

set autoread

set autowriteall

set autochdir

" allow edited buffers to be hidden
set hidden

set splitbelow splitright

set langmenu=en_US.UTF-8

set switchbuf=usetab

set history=50 " cmd history

set cmdheight=1

set sessionoptions-=options

" autocmd vimrc BufWinLeave * silent! mkview
" autocmd vimrc BufWinEnter * silent! loadview

set title

set undolevels=200

set t_Co=256

set noerrorbells visualbell t_vb=
" autocmd vimrc GUIEnter * set visualbell t_vb=

set confirm

set shortmess=atI

set clipboard=unnamedplus

set mouse=a

set mousemodel=popup_setpos

set number relativenumber

set showtabline=1

" allow bs all
set backspace=indent,eol,start

set whichwrap+=<,>,h,l,[,]

set cursorline

set encoding=utf-8 nobomb
set fileencoding=utf-8
set fileencodings=utf-8

set tags+=./.tags;/

set completeopt=longest,menuone,noselect

" backup
set backup
set undofile

set backupdir=$HOME/.vim/data/backup

if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif

set undodir=$HOME/.vim/data/undo//

if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

set directory=$HOME/.vim/data/swap//

if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

set expandtab tabstop=4 softtabstop=4 shiftwidth=4 smarttab

set autoindent

set paste
set pastetoggle=

set wrap
set wrapmargin=5
set linebreak
set showbreak=\ \ \ \ \ >\
set textwidth=120

set formatoptions+=j

set fileformat=unix
set fileformats=unix,dos,mac

set showcmd " Show us the command we're typing
set showmode " mode in status bar

" match bracket
set showmatch

" search:
set nohlsearch "no highlight search
set incsearch  " but hi as typing
set ignorecase smartcase

" Speed up macros
set lazyredraw

set showfulltag

set regexpengine=1

" folding
" manual: zf za
set foldmethod=manual

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3 sidescrolloff=2

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" ruler
set ruler

" vertical rulers:
set colorcolumn=+1

set laststatus=2

set statusline=%{HiStatusLine(mode())} " empty str, triggers highlighting
set statusline+=\%#error#%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}%*
set statusline+=\ (%{mode()})
set statusline+=\ [%{$USER}]
set statusline+=\ b:%n "buffer number
set statusline+=\ [ "start group
set statusline+=%{&fenc==\"\"?&enc:&fenc} " encoding
set statusline+=%{(exists(\"+bomb\")\ &&\ &bomb)?\"+B\":\"\"} "BOM
set statusline+=/%{&ff}/%y "fileformat/filetype
set statusline+=] "end group
set statusline+=\ %m "modifier flag
set statusline+=\ %r "readonly?
set statusline+=\ %{exists('*fugitive#statusline')?fugitive#statusline():''}
" set statusline+=\ [%t] "tail
set statusline+=\ %{exists('*tagbar#currenttag')?tagbar#currenttag('[tag:%s]',''):''}
set statusline+=%= " right align reminder
set statusline+=\ L:%l/%L(%p) "lines nu, percentage, total
set statusline+=\ col:%c "column nu
set statusline+=\ ch:0x%04B "char under cursor (hex)
set statusline+=\ bytes:%O "bytes
set statusline+=\ [%{strftime('%H:%M\ %a\ %d\ %b')}]
set statusline+=%<

" command line completion
set wildmenu
set wildmode=full

set shell=/usr/bin/env\ bash " --login

" Redefine the shell redirection operator to receive both the stderr messages
" and stdout messages
set shellredir=>%s\ 2>&1

augroup vimrc
    autocmd FileType php setlocal makeprg=/usr/bin/env\ php\ %
    autocmd FileType python setlocal makeprg=/usr/bin/env\ python3\ %
    autocmd FileType javascript setlocal makeprg=/usr/bin/env\ node\ %
    autocmd FileType sh setlocal makeprg=/usr/bin/env\ bash\ %
augroup END

autocmd vimrc FileType vim setlocal keywordprg=:help

iabbrev @@ andrew.kamenchuk@gmail.com

if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
