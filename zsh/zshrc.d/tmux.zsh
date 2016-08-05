if [[ ! -d $HOME/.tmux/plugins/tpm ]]; then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

if [ -z "$TMUX" ]; then
#   tmux attach -t main || tmux new -s main
    tmux new
fi

if [ -n "$TMUX" ]; then
fi
