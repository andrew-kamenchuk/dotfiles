if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

if [ -z "$TMUX" ]; then
    # tmux attach -t main || tmux new -s main
    # tmux new # I have a problem with gui's embedded terminals
fi
