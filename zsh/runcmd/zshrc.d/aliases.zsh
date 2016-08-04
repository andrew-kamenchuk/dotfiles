# common
alias ls="ls --color"
alias ll="ls -lh"
alias la="ll -A"
alias lr="ll -R"
alias grep="grep --color=auto --exclude-dir={.git,.svn}"
alias rgrep="grep -r"

# edit
alias vimrc="gvim --remote-tab $HOME/.vimrc 2>/dev/null"
alias zshrc="gvim --remote-tab $ZSHRC 2>/dev/null"
alias tmuxrc="gvim --remote-tan $HOME/.tmux-conf 2>/dev/null"

#
alias chrome="google-chrome"
alias gdrive="(cd $HOME/Documents/Grive && grive)"
