export GHURL="git@github.com:paradox8599"

alias vi="nvim"
alias vim="nvim"

alias lg="lazygit"

alias tad="tmux -u attach -t default"
alias tnd="tmux -u new -s default"
alias t="tad || tnd"
alias ta="tmux -u attach -t"
alias tn="tmux -u new -s"

# start hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec hypr
fi

# start tmux
if command -v tmux &> /dev/null \
    && [ -n "$PS1" ] \
    && [[ ! "$TERM" =~ screen ]] \
    && [[ ! "$TERM" =~ tmux ]] \
    && [ -z "$TMUX" ]; then
    # attach to detached session if there is any
    # otherwise create a new session
    detached_count=$(tmux ls 2>/dev/null | rg -v attached | wc -l)
    if [[ $detached_count -gt 0 ]]; then
        exec tmux attach -t $(tmux ls | rg -v attach | cut -d':' -f1 | tr '\n' ' ' | cut -d' ' -f1)
    else
        exec tmux
    fi
fi
