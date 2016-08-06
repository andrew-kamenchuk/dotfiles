#! /usr/bin/env zsh

DOTDIR=${0:a:h}

[ ! -d "$HOME/.vim" ] && mkdir "$HOME/.vim"

for dotfile in zshenv gitconfig gitignore gitmessage vimrc gvimrc ideavimrc tmux.conf ctags; do
    ln -s "$DOTDIR/$dotfile" "$HOME/.$dotfile"
done

ln -s "$DOTDIR/vim/plugins.vim" "$HOME/.vim/plugins.vim"

zsh "$DOTDIR/zsh/install.zsh"
