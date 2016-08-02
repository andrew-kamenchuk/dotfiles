vcs_format="%{$fg_bold[blue]%}%s:(%{$fg_bold[red]%}%b%{$fg_bold[blue]%})%{$reset_color%} %u %c"
vcs_actionformat="%{$fg_bold[blue]%}%s:(%{$fg_bold[red]%}%b|%a%{$fg_bold[blue]%})%{$reset_color%} %u %c"

autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git svn
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*:*' unstagedstr "%F{red}✗%f"
zstyle ':vcs_info:*:*' stagedstr '%F{yellow}*%f'
zstyle ":vcs_info:*:*" formats $vcs_format # git:(branch)
zstyle ":vcs_info:*:*" actionformats $vcs_actionformat

setopt local_options prompt_subst

autoload -Uz add-zsh-hook
add-zsh-hook precmd vcs_info


PROMPT="%(?:%F{green}:%F{red})➜ %f "'${vcs_info_msg_0_}'" %B%F{cyan}%1~%f%b %% "
RPROMPT="[%3d] ~ [%T] [%n]"
