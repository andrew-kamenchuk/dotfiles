#! /usr/bin/env zsh

[ -n "$ZDOTDIR" ] && [ ! -d "$ZDOTDIR" ] && mkdir "$ZDOTDIR"

for file (${0:a:h}/runcmd/*(.)); do
    ln -s "$file" "${ZDOTDIR:-$HOME}/.${file:t}"
done
