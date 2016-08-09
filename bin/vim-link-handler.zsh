#! /usr/bin/env zsh

file=(${(s/:/)1:6})

if [ $#file -gt 1 ]; then
    gvim --remote-tab +"$file[2]" "$file[1]"
else
    gvim --remote-tab "$file[1]"
fi
