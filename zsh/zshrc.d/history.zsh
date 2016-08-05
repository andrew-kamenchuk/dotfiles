if [ -z "$HISTFILE" ]; then
    HISTFILE="${ZDOTDIR:-$HOME}/.zhistory"
fi

HISTSIZE=10000
SAVEHIST=10000

setopt append_history
setopt extended_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history

# do not save typos in the history
zshaddhistory() {
    whence ${${(z)1}[1]} > /dev/null || return 1
}
