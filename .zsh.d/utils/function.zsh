#!/bin/zsh

bindkey "^r" fzf-select-history
bindkey '^]' fzf-src-ghq

fzf-select-history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi
  BUFFER=$(\history -n 1 | \
    eval $tac | \
    fzf --ansi --reverse --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N fzf-select-history

fzf-src-ghq () {
  local selected_dir=$(ghq list -p | fzf --ansi --reverse --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fzf-src-ghq

log_info "function.zsh loaded."
