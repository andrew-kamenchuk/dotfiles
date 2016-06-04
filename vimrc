set exrc
set secure

augroup vimrc
  autocmd!
augroup END

source ~/.vim/plugins.vim

syntax on

set background=dark

set autoread

" Allow edit buffers to be hidden
set hidden

set splitbelow splitright

set langmenu=en_US.UTF-8

set switchbuf=usetab

set history=50 " cmd history

set cmdheight=1

set sessionoptions-=options

autocmd vimrc BufWinLeave * silent! mkview
autocmd vimrc BufWinEnter * silent! loadview

set title

set undolevels=200

set t_Co=256

set noerrorbells visualbell t_vb=
autocmd vimrc GUIEnter * set visualbell t_vb=

set confirm

set shortmess=atI

set clipboard=unnamedplus

set mouse=a

set mousemodel=popup_setpos

set number relativenumber

" set nrformats-=octal

set showtabline=2

" allow bs all
set backspace=indent,eol,start

set whichwrap+=<,>,h,l,[,]

set cursorline

set encoding=utf-8 nobomb
set fileencoding=utf-8
set fileencodings=utf-8


" backup
set backup
set undofile

set backupdir=~/.vim/.data/undo
set undodir=~/.vim/.data/backup
set directory=~/.vim/.data/swap

set list
set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<

set expandtab tabstop=4 softtabstop=4 shiftwidth=4 smarttab

set autoindent

" set paste
set pastetoggle=

set wrap
set wrapmargin=5
set linebreak
set showbreak=\ \ \ \ \ >\
set textwidth=120

set modeline

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
set foldlevel=1 foldmethod=syntax

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3 sidescrolloff=2

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" ruler
set ruler

" vertical rulers:
set colorcolumn=+1

hi ColorColumn ctermbg=0  guibg=Black

" completion popup color
hi PmenuSel ctermbg=46 ctermfg=0 guibg=Black guifg=Green
hi Pmenu    ctermbg=255 ctermfg=0 guibg=White guifg=Black
" statusline
hi Statusline ctermbg=46 ctermfg=0 guibg=Black guifg=Green

autocmd vimrc InsertEnter * hi Statusline ctermbg=255 ctermfg=0 guibg=White guifg=Black
autocmd vimrc InsertLeave * hi Statusline ctermbg=46 ctermfg=0 guibg=Black guifg=Green

set laststatus=2

set statusline=%{$USER}
set statusline+=\ %n "buffer number
set statusline+=\ [ "start group
set statusline+=%{&fenc==\"\"?&enc:&fenc} " encoding
set statusline+=%{(exists(\"+bomb\")\ &&\ &bomb)?\"+B\":\"\"} "BOM
set statusline+=/%{&ff}/%y "fileformat/filetype
set statusline+=] "end group
set statusline+=\ %m "modifier flag
set statusline+=\ %r "readonly?
set statusline+=\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=\ [%f] "full filepath
set statusline+=\ %{exists('g:loaded_tagbar')?tagbar#currenttag('[TAG:\ %s]\ ','','f'):''}
set statusline+=\ %#error#
set statusline+=%{exists('g:loaded_syntastic_cheker')?SyntasticStatuslineFlag():''}
set statusline+=%*
set statusline+=\ %{strftime('%e\ %b\ %a\ %H:%M')}
set statusline+=%= " right align reminder
set statusline+=\ L:%l/%L(%p) "lines nu, percentage, total
set statusline+=\ col:%c "column nu
set statusline+=\ ch:0x%04B "char under cursor (hex)
set statusline+=\ bytes:%O "bytes

set autochdir

set ttimeout
set ttimeoutlen=100

" autocompletion
set wildmenu
set wildmode=list:longest,full

" programming related 
set tags+=./tags;/ " which tags files CTRL-] will find 
set completeopt=longest,menuone " ,preview

set shell=/usr/bin/env\ bash\ --login
" Redefine the shell redirection operator to receive both the stderr messages
" and stdout messages
set shellredir=>%s\ 2>&1

set autowrite " autosave before make

augroup vimrc
    autocmd FileType php setlocal makeprg=/usr/bin/env\ php\ %
    autocmd FileType python setlocal makeprg=/usr/bin/env\ python3\ %
    autocmd FileType javascript setlocal makeprg=/usr/bin/env\ node\ %
    autocmd FileType sh setlocal makeprg=/usr/bin/env\ bash\ %
augroup END
