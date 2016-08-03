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

# z & fzf
zz() { [ $# -gt 0 ] && _z $* || cd "$(_z -l 2>&1 | sed "s/^[0-9,.]* *//" | fzf-tmux --tac +s)" }
compctl -U -K _z_zsh_tab_completion zz

#
alias chrome="google-chrome"
alias gdrive="(cd $HOME/Documents/Grive && grive)"
