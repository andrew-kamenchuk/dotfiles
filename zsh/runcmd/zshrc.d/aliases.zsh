# common
alias ls="ls --color"
alias ll="ls -lh"
alias la="ll -A"
alias lr="ll -R"
alias grep="grep --color=auto --exclude-dir={.git,.svn}"
alias rgrep="grep -r"

# edit
alias vimrc="gvim $HOME/.vimrc 2>/dev/null"
alias zshrc="gvim $ZSHRC 2>/dev/null"

# tags
alias jstags="find . -type f -iregex '.*\.js$' -exec jsctags {} -f \; | sed '/^$/d' | sort > .tags"

#
alias chrome="google-chrome"
alias gdrive="(cd $HOME/Documents/Grive && grive)"
