
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

# rsync ~/Documents/Library to devices
sync-ebooks() {
    local devices="/media/$USER/*"
    for device in $~devices; do
        if [ ! -d "$device/Library" ]; then
            echo
            ask "There is no Library on '${device:t}'. Create?" || continue
        fi
        rsync $* -r --verbose --progress --delete --size-only --protect-args --exclude=.*/ \
            "$HOME/Documents/Library/" "$device/Library"
    done
}

ask() {
    local REPLAY
    read -q "REPLAY?$1 (y/[n]) "
    echo
    [[ $REPLAY =~ ^[yY]$ ]]
}
