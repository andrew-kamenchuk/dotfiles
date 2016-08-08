#! /usr/bin/env zsh

DOTDIR=${0:a:h}

for dotfile in zshenv gitconfig gitignore gitmessage vimrc gvimrc ideavimrc tmux.conf ctags; do
    ln -s "$DOTDIR/$dotfile" "$HOME/.$dotfile"
done

[ -d "$HOME/.vim" ] || mkdir "$HOME/.vim"

ln -s $DOTDIR/vim/* "$HOME/.vim"

[ -d "$HOME/.bin" ] || mkdir "$HOME/.bin"

ln -s $DOTDIR/bin/* "$HOME/.bin"

source "$HOME/.zshenv"

source "$DOTDIR/zsh/install.zsh"
