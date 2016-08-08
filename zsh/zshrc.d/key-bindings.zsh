bindkey -v

bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^G" send-break
bindkey "^K" kill-line

# cursor keys
#bindkey "\eOA" up-line-or-history
#bindkey "\eOB" down-line-or-history
bindkey "\eOA" history-substring-search-up
bindkey "\eOB" history-substring-search-down
bindkey "\eOC" forward-char
bindkey "\eOD" backward-char

bindkey "^[[1;3C" insert-cycledright
bindkey "^[[1;3D" insert-cycledleft

bindkey '^R' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.

bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

bindkey "^X^U" undo
bindkey "^Xu" undo

bindkey '^[[Z' reverse-menu-complete                 # [Shift-Tab]

expand-or-complete-with-dots() {
    print -n -P "%{%F{red}......%f%}"

    zle expand-or-complete
    zle redisplay
}

zle -N expand-or-complete-with-dots

bindkey "^I" expand-or-complete-with-dots

# predict
autoload -Uz predict-on

predict-toggle() {
    ((predict_on=1-predict_on)) && predict-on || predict-off
}

zle -N predict-toggle

zstyle ":predict" verbose true

bindkey "^X^A" predict-toggle

abbreviations=(${(f)"$(alias | sed 's/=.*//')"})

# expand alias
expand-alias() {
    if [[ $LBUFFER =~ '^\s*'${(j:|:)abbreviations}'$' ]]; then
        zle _expand_alias
        zle expand-word
    fi

    zle self-insert
}

zle -N expand-alias

bindkey " " expand-alias
