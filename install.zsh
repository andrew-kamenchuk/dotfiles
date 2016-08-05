#! /usr/bin/env zsh

CURRENT_DIR=${0:a:h}

[ ! -d "$HOME/.vim" ] && mkdir "$HOME/.vim"

dotfiles=(zshenv gitconfig gitignore gitmessage vimrc gvimrc ideavimrc tmux.conf ctags)

for dotfile in $dotfiles; do
    ln -s "$CURRENT_DIR/$dotfile" "$HOME/.$dotfile"
done;

ln -s "$CURRENT_DIR/vim/plugins.vim" "$HOME/.vim/plugins.vim"

source "$CURRENT_DIR/zsh/install.zsh"
