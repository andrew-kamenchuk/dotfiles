#! /usr/bin/env zsh
[[ ! -z $ZDOTDIR && ! -d $ZDOTDIR ]] && mkdir $ZDOTDIR

for file in ${0:a:h}/runcmd/*(.); do
    ln -s $file ${ZDOTDIR:-$HOME}/.${file:t}
done;
