
# z & fzf
zz() {
    whence _z > /dev/null || return 1

    if [ $# -gt 0 ] || ! whence fzf-tmux > /dev/null; then
        _z $*
    else
        cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf-tmux --tac +s)"
    fi
}

compctl -U -K _z_zsh_tab_completion zz
