#!/bin/zsh

fbr() {
  local branches=$(git branch -vv | fzf --ansi --reverse --query "$LBUFFER")
  if [ -n "$branches" ]; then
    BUFFER="git checkout $(echo "$branches" | awk '{print $1}' | sed "s/.* //")"
    zle accept-line
  fi
  zle clear-screen
}
zle -N fbr

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

ref_enter() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi
  echo
  ls -aGU
  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
    echo
    echo -e "\e[0;33m--- git status ---\e[0m"
    git status -sb
  fi
  zle reset-prompt
  return 0
}
zle -N ref_enter

log_pass "Loading complete function.zsh"
